output "linux_virtualm_ip" {
  value = azurerm_linux_virtual_machine.linux_virtual_machine.public_ip_address
}

output "linux_virtualm_username" {
  value = azurerm_linux_virtual_machine.linux_virtual_machine.admin_username
}

output "acr_login_url" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_login_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_login_password" {
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "aks_kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
  sensitive = true
}