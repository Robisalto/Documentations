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

variable "net_subnets" {
  default = {
    "main" = "10.0.1.0/24"
  }
  description = "Sous réseau dans lequel raccorder les instances"
  type        = map(string)
  validation {
    condition     = can([for subnet in var.net_subnets : regex("^255.255.255.0$", try(cidrnetmask(subnet), ""))])
    error_message = "Net_subnets doit contenir des réseaux avec un masque /24."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags à appliquer sur les ressources"
}
