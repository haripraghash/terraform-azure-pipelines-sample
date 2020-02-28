#-------keyvault-secret\main.tf---#
data "azurerm_key_vault" "app_vault" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = data.azurerm_key_vault.app_vault.id

  tags = {
    environment = var.environment
  }
}