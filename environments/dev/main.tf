resource "azurerm_resource_group" "dev" {
  name     = "rg-${var.project}-${var.environment}-001"
  location = var.location

  tags = {
    environment = var.environment
    project     = var.project
    managed_by  = "terraform"
  }
}
