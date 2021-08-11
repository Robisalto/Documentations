variable "app_container_count" {
  default     = 1
  description = "Nombre de conteneurs de stockage à créer"
  type        = number
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string

  validation {
    condition     = can(regex("^aks-\\d{2}$", var.cluster_name))
    error_message = "Nom de cluster incorrect, ne respecte pas la contrainte."
  }
}

variable "default_pool_name" {
  default     = "default"
  description = "Default node pool name"
  type        = string

  validation {
    condition     = can(regex("^[\\w\\d]*$", var.default_pool_name))
    error_message = "Nom de pool incorrect."
  }
}

variable "default_pool_vm_count" {
  default     = 1
  description = "Default node pool size"
  type        = number

  validation {
    condition     = var.default_pool_vm_count >= 1
    error_message = "Nombre d'instance incorrect."
  }
}

variable "default_pool_vm_size" {
  default     = "Standard_A2_v2"
  description = "Default node pool VM size"
  type        = string

  validation {
    condition     = contains(["Standard_A2_v2", "Standard_A4_v2"], var.default_pool_vm_size)
    error_message = "Type d'instance incorrect."
  }
}

variable "helm_apps" {
  default     = {}
  description = "Applications à déployer avec Helm"
  type        = map(map(string))
}
