# #-------terraform\data.tf--#
# data "azurerm_key_vault" "app_vault" {
#   name                = local.keyvault_name
#   resource_group_name = local.resource_group_name
#   depends_on = [module.app_resource_group]
# }

# data "azurerm_key_vault_secret" "cosmos-endpoint" {
#   name         = "Cosmos-Endpoint"
#   key_vault_id = data.azurerm_key_vault.app_vault.id
#   depends_on = [module.app_resource_group, module.keyvault_secret_cosmos_endpoint]
# }

# data "azurerm_key_vault_secret" "cosmos-key" {
#   name         = "Cosmos-Key"
#   key_vault_id = data.azurerm_key_vault.app_vault.id
#   depends_on = [module.app_resource_group, module.keyvault_secret_cosmos_key]
# }