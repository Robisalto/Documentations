variable "disk_size" {
  description = "Taille du disque additionel"
  type        = number
  default     = 30
}

variable "image" {
  description = "Image de l'instance"
  type        = string
  default     = "ubuntu_focal"
}

variable "instance_name" {
  description = "Nom du serveur instance"
  type        = string
  default     = "foobar01"
}

variable "instance_type" {
  description = "Type d'instance à utiliser"
  type        = string
  default     = "DEV1-S"
}

variable "private_address" {
  description = "Adresse IP privée de l'instance"
  type        = string
}

variable "private_key_file" {
  description = "Fichier contenant la clé privée pour se connecter à l'instance"
  type        = string
  default     = "/tmp/foobar.priv"
}

variable "private_network_id" {
  description = "ID du réseau privé auquel rattacher l'instance"
  type        = string
}

variable "security_group_id" {
  description = "ID du groupe de sécurité auquel rattacher l'instance"
  type        = string
}
