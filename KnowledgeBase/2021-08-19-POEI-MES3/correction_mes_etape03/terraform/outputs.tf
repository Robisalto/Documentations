output "instances_ips" {
  description = "Instances IP adresses"
  value       = concat(module.app.instances_ips, module.es_cluster.instances_ips)
}
