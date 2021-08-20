output "ip" {
  value = "${scaleway_instance_server.server.name} - ${scaleway_instance_server.server.public_ip}"
}
