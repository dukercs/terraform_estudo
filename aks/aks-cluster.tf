provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "wordpressrg"
  location = "West US 3"

  tags = {
    environment = "Wordpress"
  }
}

resource "azurerm_container_registry" "default" {
  name                = "dukercsmcr1"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku                 = "Basic"
}


resource "azurerm_kubernetes_cluster" "default" {
  name                = "wordpress-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "wordpress-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_D2s_v3"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Wordpress"
  }
}
