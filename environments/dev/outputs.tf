output "resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.dev.name
}

output "resource_group_location" {
  description = "The Azure region of the resource group."
  value       = azurerm_resource_group.dev.location
}
