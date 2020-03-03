#-------keyvault-secret\main.tf---#

resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = var.keyvault_id

  tags = {
    environment = var.environment
  }
}