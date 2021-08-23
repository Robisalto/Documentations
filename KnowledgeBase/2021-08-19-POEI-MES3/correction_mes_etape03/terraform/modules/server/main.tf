#
# Provider
#
terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.0.0"
    }
  }
}


#
# Network
#
resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_private_nic" "inet_priv" {
  server_id          = scaleway_instance_server.server.id
  private_network_id = var.private_network_id
}


#
# Disk
#
resource "scaleway_instance_volume" "volume" {
  type       = "b_ssd"
  size_in_gb = var.disk_size
}


#
# Instance
#
resource "scaleway_instance_server" "server" {
  type                  = var.instance_type
  image                 = var.image
  name                  = var.instance_name
  ip_id                 = scaleway_instance_ip.public_ip.id
  security_group_id     = var.security_group_id
  additional_volume_ids = [scaleway_instance_volume.volume.id]

  # Exemple de provisioner pour déployer Docker
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.public_ip
      private_key = file(var.private_key_file)
    }
    inline = [
      "apt-get update",
      "apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
      "echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "apt-get update",
      "apt-get install -y docker-ce docker-ce-cli containerd.io",
      "curl -L \"https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose",
      "chmod +x /usr/local/bin/docker-compose"
    ]
  }
}

# Utilisation d'une ressource factice pour lancer Ansible
resource "null_resource" "inet_priv_cfg" {
  provisioner "local-exec" {
    command = "ansible-playbook -u root --private-key ${var.private_key_file} --ssh-extra-args='-o StrictHostKeyChecking=no' -i ${scaleway_instance_server.server.public_ip}, -e _private_inet_ip_address=${var.private_address} -e _private_inet_mac_address=${scaleway_instance_private_nic.inet_priv.mac_address} ../ansible/configure_inet.yml"
  }
}
