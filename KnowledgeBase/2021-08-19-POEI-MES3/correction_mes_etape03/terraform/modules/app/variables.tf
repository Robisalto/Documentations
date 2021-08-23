variable "_count" {
  description = "Nombre de noeud"
  type        = number
  default     = 1
}
variable "_count_base" {
  description = "Index à utiliser pour le nommage"
  type        = number
  default     = 0
}

variable "instance_name_prefix" {
  description = "Prefixe à utiliser pour le nom du serveur instance"
  type        = string
  default     = "foobar"
}

variable "instance_type" {
  description = "Type d'instance à utiliser"
  type        = string
  default     = "DEV1-XL"
}

variable "private_addresses" {
  description = "Adresses privées à utiliser"
  type        = list(string)
}

variable "private_network_id" {
  description = "ID du réseau privé auquel rattacher l'instance"
  type        = string
}

variable "security_group_id" {
  description = "ID du groupe de sécurité auquel rattacher l'instance"
  type        = string
}
