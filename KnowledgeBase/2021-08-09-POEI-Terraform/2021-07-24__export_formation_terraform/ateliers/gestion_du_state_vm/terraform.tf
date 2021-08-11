terraform {
  #backend "azurerm" {
  #  resource_group_name  = "ach-formation-dev"
  #  storage_account_name = "ach7ad09205e0ada6c1"
  #  container_name       = "tf-backend"
  #  key                  = "terraform.tfstate-"
  #}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.67.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}


provider "azurerm" {
  features {}
}

provider "random" {}


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
  name     = "${local.trigram}-formation-${terraform.workspace}"
  location = "France Central"
}

resource "random_id" "backend_id" {
  byte_length = 8
}

resource "azurerm_storage_account" "backend_account" {
  name                     = "ach${random_id.backend_id.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "terraform_backend" {
  name                  = "tf-backend"
  storage_account_name  = azurerm_storage_account.backend_account.name
  container_access_type = "private"
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
