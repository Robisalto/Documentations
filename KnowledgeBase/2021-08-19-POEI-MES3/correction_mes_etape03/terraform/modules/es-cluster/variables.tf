variable "_count" {
  description = "Nombre de noeud dans le cluster"
  type        = number
  default     = 3
}

variable "instance_name_prefix" {
  description = "Prefixe à utiliser pour le nom du serveur instance"
  type        = string
  default     = "foobar"
}

variable "instance_type" {
  description = "Type d'instance à utiliser"
  type        = string
  default     = "DEV1-S"
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
