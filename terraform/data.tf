#-------terraform\data.tf--#
data "azurerm_key_vault" "app_vault" {
  name                = local.keyvault_name
  resource_group_name = local.resource_group_name
}

data "azurerm_key_vault_secret" "cosmos-endpoint" {
  name         = "Cosmos-Endpoint"
  key_vault_id = data.azurerm_key_vault.app_vault.id
}

data "azurerm_key_vault_secret" "cosmos-key" {
  name         = "Cosmos-Key"
  key_vault_id = data.azurerm_key_vault.app_vault.id
}