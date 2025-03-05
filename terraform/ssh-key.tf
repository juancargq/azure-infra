# Se crean las claves SSH
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

# Se mueve la clave privada a una ubicación específica de mi PC
resource "local_file" "mv_private_key" {
  filename         = pathexpand("~/.ssh/azure-vm-key.pem")
  content          = tls_private_key.ssh.private_key_pem
  file_permission  = "0600"
}

# Se mueve la clave pública a una ubicación específica de mi PC
resource "local_file" "mv_public_key" {
  filename         = pathexpand("~/.ssh/azure-vm-key.pub")
  content          = tls_private_key.ssh.public_key_openssh
  file_permission  = "0600"
} 