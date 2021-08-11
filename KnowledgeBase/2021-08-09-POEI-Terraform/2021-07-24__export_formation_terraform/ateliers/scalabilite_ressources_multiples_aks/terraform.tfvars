app_container_count = 2
cluster_name        = "aks-01"
helm_apps = {
  dashboard = {
    chart      = "kubernetes-dashboard"
    namespace  = "kubernetes-dashboard"
    repository = "https://kubernetes.github.io/dashboard"
  },
  kubeapps = {
    chart      = "kubeapps"
    namespace  = "kubeapps"
    repository = "https://charts.bitnami.com/bitnami"
  }
}
