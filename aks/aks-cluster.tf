provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "default" {
#   name     = "wordpressrg"
#   location = "West US 3"

#   tags = {
#     environment = "Wordpress"
#   }
# }

resource "azurerm_container_registry" "default" {
  name                = "dukercsmcr1"
  resource_group_name = var.resourcegroup
  location            = var.local
  sku                 = "Basic"
}


resource "azurerm_kubernetes_cluster" "default" {
  name                = "wordpress-aks"
  location            = var.local
  resource_group_name = var.resourcegroup
  dns_prefix          = "wordpress-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_D2s_v3"
    os_disk_size_gb = 30
  }

  role_based_access_control {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "Wordpress"
  }
}

resource "azurerm_role_assignment" "default" {
  principal_id                     = azurerm_kubernetes_cluster.default.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.default.id
  skip_service_principal_aad_check = true
}