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


#
# Service
#
module "server" {
  count  = var._count
  source = "../server"

  instance_name      = "${var.instance_name_prefix}-${count.index + 1}"
  instance_type      = var.instance_type
  private_address    = var.private_addresses[count.index]
  private_network_id = var.private_network_id
  security_group_id  = var.security_group_id
}
