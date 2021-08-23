output "instance_ips" {
  description = "Instance IP adresses"
  value = {
    name       = scaleway_instance_server.server.name
    public_ip  = scaleway_instance_server.server.public_ip
    private_ip = var.private_address
  }
}
