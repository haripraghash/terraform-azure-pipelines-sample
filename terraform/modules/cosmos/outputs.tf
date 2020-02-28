#---------cosmos\outputs.tf----#
output "cosmos_primary_key" {
  value       = azurerm_cosmosdb_account.db.primary_master_key
  description = "Cosmos db primary master key"
}

output "cosmos_primary_connection_string" {
  value       = azurerm_cosmosdb_account.db.name
  description = "Storage account name"
}

output "cosmos-db-id" {
  value = "${azurerm_cosmosdb_account.db.id}"
}

output "cosmos-db-endpoint" {
  value = "${azurerm_cosmosdb_account.db.endpoint}"
}
