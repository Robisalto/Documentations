#
# Provider
#
terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}

provider "scaleway" {}


#
#
#
locals {
  es_cluster_node_count = 3
  sg_app_rules          = [22, 3000, 5601, 9090]
  private_addresses = {
    app = [
      "192.168.0.10/24",
    ]
    es = [
      "192.168.0.20/24",
      "192.168.0.21/24",
      "192.168.0.22/24",
    ],
  }
  ansible_inventory_content = templatefile(
    "${path.module}/templates/ansible_inventory.tpl",
    {
      app_instances        = module.app.instances_ips,
      es_cluster_instances = module.es_cluster.instances_ips
    }
  )
}


#
# Network
#
resource "scaleway_vpc_private_network" "net" {
  name = "ACH - Private"
}

resource "scaleway_instance_security_group" "sg_app" {
  dynamic "inbound_rule" {
    for_each = local.sg_app_rules
    content {
      action = "accept"
      port   = inbound_rule.value
    }
  }
}

resource "scaleway_instance_security_group" "sg_es" {
  inbound_rule {
    action = "accept"
    port   = 22
  }
}


#
# Services
#
module "es_cluster" {
  source = "./modules/es-cluster"

  _count               = local.es_cluster_node_count
  instance_name_prefix = "ach-alex"
  instance_type        = "DEV1-S"
  private_addresses    = local.private_addresses.es
  private_network_id   = scaleway_vpc_private_network.net.id
  security_group_id    = scaleway_instance_security_group.sg_es.id
}

module "app" {
  source = "./modules/app"

  _count_base          = local.es_cluster_node_count
  instance_name_prefix = "ach-alex"
  instance_type        = "DEV1-XL"
  private_addresses    = local.private_addresses.app
  private_network_id   = scaleway_vpc_private_network.net.id
  security_group_id    = scaleway_instance_security_group.sg_app.id
}


#
# Inventaire Ansible
#
resource "null_resource" "ansible_inventory" {
  provisioner "local-exec" {
    command = "echo \"${local.ansible_inventory_content}\" > ../ansible/hosts"
  }
}


#
# Docker services
#
resource "null_resource" "es_cluster" {
  depends_on = [null_resource.ansible_inventory]

  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ../ansible/hosts -l es_cluster ../ansible/deploy_es_cluster.yml"
  }
}
resource "null_resource" "kibana_logstash" {
  depends_on = [null_resource.es_cluster]

  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ../ansible/hosts -l app ../ansible/deploy_kibana_logstash.yml"
  }
}
resource "null_resource" "filebeat" {
  depends_on = [null_resource.kibana_logstash]

  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ../ansible/hosts -l all ../ansible/deploy_filebeat.yml"
  }
}
resource "null_resource" "nodeexporter" {
  depends_on = [null_resource.kibana_logstash]

  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ../ansible/hosts -l all ../ansible/deploy_nodeexporter.yml"
  }
}
resource "null_resource" "prometheus" {
  depends_on = [null_resource.kibana_logstash]

  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ../ansible/hosts -l all ../ansible/deploy_prometheus.yml"
  }
}
resource "null_resource" "grafana" {
  depends_on = [null_resource.kibana_logstash]

  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ../ansible/hosts -l all ../ansible/deploy_grafana.yml"
  }
}
