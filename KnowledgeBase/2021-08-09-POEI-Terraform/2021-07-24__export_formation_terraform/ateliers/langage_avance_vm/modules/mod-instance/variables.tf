variable "rg_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "subnet_id" {
  type        = string
  description = "ID du sous-réseau auquel rattacher l'instance"
}

variable "vm_name" {
  description = "Nom de l'instance"
  type        = string
  validation {
    condition     = can(regex("^vm-az-[a-z]{3}-\\d{2}$", var.vm_name))
    error_message = "Nom d'instance incorrect, ne respecte pas la contrainte."
  }
}

variable "vm_size" {
  default     = "Standard_A1_v2"
  type        = string
  description = "Type de l'instance"
}

variable "tags" {
  type        = map(string)
  description = "Tags à appliquer sur les ressources"
}
