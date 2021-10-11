resource "azurerm_resource_group" "rg" {
  name     = "test-group"
  location = var.location 
  tags = var.tags
}