output "vm_infos" {
  description = "Informations concernant l'instance"
  value = format(
    "%s | %s | %s",
    azurerm_linux_virtual_machine.instance.name,
    join(",", azurerm_linux_virtual_machine.instance.public_ip_addresses),
    join(",", azurerm_linux_virtual_machine.instance.private_ip_addresses),
  )
}
