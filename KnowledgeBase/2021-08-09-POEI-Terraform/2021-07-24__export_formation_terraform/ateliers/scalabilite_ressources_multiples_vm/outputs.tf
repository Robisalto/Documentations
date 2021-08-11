output "vm_infos" {
  description = "Informations concernant l'instance"
  value       = module.instance.*.vm_infos
}
