# Se define la máquina virtual Linux
resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  name                  = var.virtual_machine_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  admin_username        = "ubuntu"
  size                  = "Standard_DS1_v2"
  network_interface_ids = [ azurerm_network_interface.network_interface.id ]
  availability_set_id   = azurerm_availability_set.availability_set.id

  os_disk {
    storage_account_type = "StandardSSD_LRS"
    caching              = "ReadWrite"
  }

  admin_ssh_key {
    username   = "ubuntu"
    public_key = trimspace(tls_private_key.ssh.public_key_openssh)
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "22.04.202502280"
  }
}