terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.1.0"
    }
  }
}

provider "scaleway" {
}

locals {
  app_ports = [22, 5601, 9090, 3000]
}

resource "scaleway_vpc_private_network" "private" {
}

resource "scaleway_instance_security_group" "es_cluster" {
  inbound_default_policy = "drop"

  inbound_rule {
    action = "accept"
    port   = 22
  }
}

resource "scaleway_instance_security_group" "app" {
  inbound_default_policy = "drop"

  dynamic "inbound_rule" {
    for_each = local.app_ports

    content {
      action = "accept"
      port   = inbound_rule.value
    }
  }
}

module "es_cluster" {
  source = "./modules/es_cluster"

  sec_group_id = scaleway_instance_security_group.es_cluster.id
  priv_net_id  = scaleway_vpc_private_network.private.id
}

module "app" {
  source = "./modules/app"

  sec_group_id = scaleway_instance_security_group.app.id
  priv_net_id  = scaleway_vpc_private_network.private.id
}
