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
  storage_policy_rules = [
    {
      name    = "auto-remove-daily-backups"
      enabled = true
      filters = {
        blob_types   = ["blockBlob"]
        prefix_match = ["backup/daily", ]
      }
      actions = {
        version = {
          delete_after_days_since_creation = 14
        }
      }
    },
    {
      name    = "auto-remove-weekly-backups"
      enabled = false
      filters = {
        blob_types   = ["blockBlob"]
        prefix_match = ["backup/weekly", ]
      }
      actions = {
        version = {
          delete_after_days_since_creation = 8
        }
      }
    },
  ]
  tags = {
    trigram  = upper(local.trigram)
    # year     = format("Y-%s", formatdate("YYYY", timestamp()))
    # semester = formatdate("M", timestamp()) < 7 ? "S-01" : "S-02"
  }
}


#
# Resources
#
resource "azurerm_resource_group" "rg" {
  name     = "${local.trigram}-formation-${terraform.workspace}"
  location = "francecentral"
  tags     = local.tags

  lifecycle {
    ignore_changes = [tags]
  }
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
  tags                     = local.tags
}

resource "azurerm_storage_management_policy" "policy" {
  storage_account_id = azurerm_storage_account.backend_account.id

  dynamic "rule" {
    for_each = local.storage_policy_rules
    content {
      name    = rule.value.name
      enabled = rule.value.enabled
      dynamic "actions" {
        for_each = [rule.value.actions]
        content {
          dynamic "version" {
            for_each = [actions.value.version]
            content {
              delete_after_days_since_creation = version.value.delete_after_days_since_creation
            }
          }
        }
      }
      dynamic "filters" {
        for_each = [rule.value.filters]
        content {
          prefix_match = filters.value.prefix_match
          blob_types   = filters.value.blob_types
        }
      }
    }
  }
}

resource "azurerm_storage_container" "terraform_backend" {
  name                  = "tf-backend"
  storage_account_name  = azurerm_storage_account.backend_account.name
  container_access_type = "private"
}

module "private_network" {
  source     = "./modules/mod-network"
  depends_on = [azurerm_resource_group.rg]

  rg_name     = azurerm_resource_group.rg.name
  net_space   = var.net_space
  net_subnets = var.net_subnets
  trigram     = local.trigram
  tags        = local.tags
}

module "instance" {
  count      = var.instance_count
  source     = "./modules/mod-instance"
  depends_on = [azurerm_resource_group.rg]

  rg_name   = azurerm_resource_group.rg.name
  subnet_id = module.private_network.subnets_id.main
  vm_name   = format("%s-%02d", var.vm_name_prefix, count.index + 1)
  vm_size   = var.vm_size
  tags      = local.tags
}
