resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "aryk8s"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aryk8s"
  kubernetes_version  = "1.21.2"

  role_based_access_control {
    enabled        = true
  }

  identity {
    type = "SystemAssigned"
  }
  
  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = "${trimspace(tls_private_key.key.public_key_openssh)} ${var.admin_username}@azure.com"
    }
  }

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_B2ms"
  }

  /*
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }*/
}

output "cluster_client_key" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].client_key
  sensitive = false
}

output "cluster_client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate
  sensitive = false
}

output "cluster_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate
  sensitive = false
}

output "cluster_cluster_username" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].username
  sensitive = false
}

output "cluster_cluster_password" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].password
  sensitive = false
}

output "cluster_kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
  sensitive = false
}

output "cluster_host" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].host
  sensitive = false
}

output "SERVICE_PRINCIPAL_ID" {
  value = azurerm_kubernetes_cluster.cluster.identity.0.principal_id
  sensitive = false
}