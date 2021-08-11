terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.67.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.2.0"
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
  location = "francecentral"
}

module "aks_cluster" {
  source     = "./modules/mod-aks"
  depends_on = [azurerm_resource_group.rg]

  rg_name               = azurerm_resource_group.rg.name
  cluster_name          = "${local.trigram}-${var.cluster_name}"
  default_pool_name     = var.default_pool_name
  default_pool_vm_count = var.default_pool_vm_count
  default_pool_vm_size  = var.default_pool_vm_size
}

module "wordpress" {
  source = "./modules/mod-helm-app"

  release_config = {
    name       = "wordpress"
    chart      = "wordpress"
    namespace  = "wordpress"
    repository = "https://charts.bitnami.com/bitnami"
  }
}
