resource "azurerm_container_registry" "container_registry" {
  name                = "aryacr"
  tags = var.tags
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Standard"
}

output "registry_hostname" {
  value = azurerm_container_registry.container_registry.login_server
  sensitive = false
}

output "registry_un" {
  value = azurerm_container_registry.container_registry.admin_username
  sensitive = false
}

output "registry_pw" {
  value = azurerm_container_registry.container_registry.admin_password
  sensitive = false
}