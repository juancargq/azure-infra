# Se define el proveedor de Azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
    local = {
       source  = "hashicorp/local"
       version = "2.5.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Se define el grupo de recursos
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Se define el conjunto de disponibilidad para las máquinas virtuales
resource "azurerm_availability_set" "availability_set" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
}