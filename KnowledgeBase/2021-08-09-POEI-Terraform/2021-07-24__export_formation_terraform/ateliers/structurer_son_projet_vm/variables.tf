variable "net_space" {
  default     = "10.0.0.0/16"
  description = "Réseau IP géré par le réseau à créer"
  type        = string

  validation {
    condition     = try(cidrnetmask(var.net_space), null) == "255.255.0.0"
    error_message = "Net_space doit être un réseau avec un masque /16."
  }
}

variable "net_subnet" {
  default     = "10.0.1.0/24"
  description = "Sous réseau dans lequel raccorder les instances"
  type        = string

  validation {
    condition     = try(cidrnetmask(var.net_subnet), null) == "255.255.255.0"
    error_message = "Net_subnet doit être un réseau avec un masque /24."
  }
}

variable "vm_name" {
  description = "Nom de l'instance"
  type        = string

  validation {
    condition     = can(regex("^vm-az-ach-\\d{2}$", var.vm_name))
    error_message = "Nom d'instance incorrect, ne respecte pas la contrainte."
  }
}

variable "vm_size" {
  default     = "Standard_A1_v2"
  type        = string
  description = "Type de l'instance"

  validation {
    condition     = contains(["Standard_A1_v2", "Standard_A2_v2"], var.vm_size)
    error_message = "Type d'instance incorrect."
  }
}
