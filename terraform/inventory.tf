# Genera el inventario de Ansible de forma dinámica
resource "local_file" "ansible_inventory" {

    content = templatefile("../ansible/inventory.tmpl", {
        linux_virtualm_ip = azurerm_linux_virtual_machine.linux_virtual_machine.public_ip_address
        linux_virtualm_username = azurerm_linux_virtual_machine.linux_virtual_machine.admin_username
        linux_virtualm_priv_key = local_file.mv_private_key.filename
    })
    filename = "../ansible/inventory.ini"
    file_permission = "0644"

    depends_on = [ azurerm_linux_virtual_machine.linux_virtual_machine ]
}

# Genera un fichero de variables para Ansible
resource "local_file" "tf_ansible_vars" {
  content = <<-DOC
    acr_registry: ${azurerm_container_registry.acr.login_server}
    acr_username: ${azurerm_container_registry.acr.admin_username}
    acr_password: ${azurerm_container_registry.acr.admin_password}
    DOC
  filename = "../ansible/tf_ansible_vars.yaml"
  file_permission = "0644"

  depends_on = [ azurerm_container_registry.acr ]
}