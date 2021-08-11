output "subnets_id" {
  description = "ID des sous-réseau créés"
  value = tomap({
    for k, v in azurerm_subnet.subnets : k => v.id
  })
}
