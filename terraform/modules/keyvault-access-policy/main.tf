#----modules\keyvault-access-policy\main.tf----#

resource "azurerm_key_vault_access_policy" "keyvault_access_policy" {
  key_vault_id = var.keyvault_id

  tenant_id = var.tenant_id
  object_id = var.object_id

  key_permissions = [
    "get"
  ]

  secret_permissions = [
    "get",
    "set",
    "list",
    "delete"
  ]
}