# Se define el cluster de Kubernetes
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.azure_kubernetes_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "kubernetescp2"

  default_node_pool {
    name       = "nodepool"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    entorno = "CP2"
  }

  depends_on = [azurerm_resource_group.resource_group]
}