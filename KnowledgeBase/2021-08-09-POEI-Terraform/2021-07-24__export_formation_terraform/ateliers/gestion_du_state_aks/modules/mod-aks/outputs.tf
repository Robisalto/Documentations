output "kubeconfig" {
  description = "Kubeconfig file content"
  sensitive   = true
  value       = azurerm_kubernetes_cluster.cluster.kube_config.0
}

output "kubeconfig_raw" {
  description = "Kubeconfig file content"
  sensitive   = true
  value       = azurerm_kubernetes_cluster.cluster.kube_config_raw
}
