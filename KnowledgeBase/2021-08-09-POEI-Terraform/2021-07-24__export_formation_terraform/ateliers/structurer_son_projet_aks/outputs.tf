output "kubeconfig" {
  description = "Kubeconfig file content"
  sensitive   = true
  value       = module.aks_cluster.kubeconfig_raw
}
