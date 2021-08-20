terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.1.0"
    }
  }
}

resource "scaleway_instance_ip" "public_ip" {
}

resource "scaleway_instance_volume" "disk" {
  type = "b_ssd"
  size_in_gb = 30
}

resource "scaleway_instance_server" "server" {
  type = var.instance_type
  image = "ubuntu_focal"
  name  = var.name
  ip_id = scaleway_instance_ip.public_ip.id
  additional_volume_ids = [ scaleway_instance_volume.disk.id ]
  security_group_id = var.sec_group_id
}

resource "scaleway_instance_private_nic" "nic" {
  server_id = scaleway_instance_server.server.id
  private_network_id = var.priv_net_id
}
