terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.67.0"
    }
  }
}


provider "azurerm" {
  features {}
}


#
# Locals
#
locals {
  trigram = "ach"
}


#
# Resources
#
resource "azurerm_resource_group" "rg" {
  name     = "${local.trigram}-formation"
  location = "France Central"
}

module "private_network" {
  source     = "./modules/mod-network"
  depends_on = [azurerm_resource_group.rg]

  rg_name    = azurerm_resource_group.rg.name
  net_space  = var.net_space
  net_subnet = var.net_subnet
  trigram    = local.trigram
}

module "instance" {
  source     = "./modules/mod-instance"
  depends_on = [azurerm_resource_group.rg]

  rg_name   = azurerm_resource_group.rg.name
  subnet_id = module.private_network.subnet_id
  vm_name   = var.vm_name
  vm_size   = var.vm_size
}
