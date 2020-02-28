#----resource-group/outputs.tf----#

output "resource_group_id" {
  value       = azurerm_resource_group.app-resource-group.id
  description = "Resource group id"
}

output "resource_group_name" {
  value       = azurerm_resource_group.app-resource-group.name
  description = "Resource group name"
}