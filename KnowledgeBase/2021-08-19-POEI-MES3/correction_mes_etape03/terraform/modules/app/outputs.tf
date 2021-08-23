output "instances_ips" {
  description = "Instances IP adresses"
  value       = module.server[*].instance_ips
}
