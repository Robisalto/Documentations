terraform {
  #backend "azurerm" {
  #  resource_group_name  = "ach-formation-dev"
  #  storage_account_name = "ach8b703c6f3f3e2404"
  #  container_name       = "tf-backend"
  #  key                  = "terraform.tfstate"
  #}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.67.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.2.0"
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

provider "helm" {
  kubernetes {
    host                   = module.aks_cluster.kubeconfig.host
    client_certificate     = base64decode(module.aks_cluster.kubeconfig.client_certificate)
    client_key             = base64decode(module.aks_cluster.kubeconfig.client_key)
    cluster_ca_certificate = base64decode(module.aks_cluster.kubeconfig.cluster_ca_certificate)
  }
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
    year     = format("Y-%s", formatdate("YYYY", timestamp()))
    semester = formatdate("M", timestamp()) < 7 ? "S-01" : "S-02"
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

module "aks_cluster" {
  source     = "./modules/mod-aks"
  depends_on = [azurerm_resource_group.rg]

  rg_name               = azurerm_resource_group.rg.name
  cluster_name          = "${local.trigram}-${var.cluster_name}"
  default_pool_name     = var.default_pool_name
  default_pool_vm_count = var.default_pool_vm_count
  default_pool_vm_size  = var.default_pool_vm_size
  tags                  = local.tags
}

module "wordpress" {
  source = "./modules/mod-helm-app"

  release_config = {
    name       = "wordpress"
    chart      = "wordpress"
    namespace  = "wordpress"
    repository = "https://charts.bitnami.com/bitnami"
  }
  tags = local.tags
}
