variable "rg_name" {
  type        = string
  description = "Nom du groupe de ressources"
}

variable "trigram" {
  type        = string
  description = "Trigramme à utiliser pour le nommage des ressources"
}
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
