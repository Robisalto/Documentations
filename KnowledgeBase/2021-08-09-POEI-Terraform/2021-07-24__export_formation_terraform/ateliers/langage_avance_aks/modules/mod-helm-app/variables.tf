variable "release_config" {
  description = "Configuration de la release Helm à deployer"
}

variable "tags" {
  type        = map(string)
  description = "Tags à appliquer sur les ressources"
}
