#---------storage\outputs.tf----#
output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "Storage account id"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "Storage account name"
}

output "storage_account_primary_coonection_string" {
  value       = azurerm_storage_account.storage.primary_connection_string
  description = "Storage account primary connection string"
}