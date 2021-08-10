terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.2.0"
    }
  }
}

resource "helm_release" "release" {
  name             = var.release_config.name
  chart            = var.release_config.chart
  namespace        = var.release_config.namespace
  repository       = var.release_config.repository
  recreate_pods    = true
  create_namespace = true
}
