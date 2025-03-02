# Se define el Azure Conttainer Registry
resource "azurerm_container_registry" "acr" {
  name                = var.azure_container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  
  tags = {
    entorno = "CP2"
  }
}

# Se conecta el Container Registry con el cluster de Kubernetes
resource "azurerm_role_assignment" "acr_aks_role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}