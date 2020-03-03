#------------keyvault\main.tf---------#
# data "azurerm_client_config" "current" {
#   name = var.keyvault_name
# }

resource "azurerm_key_vault" "example" {
  name                        = var.keyvault_name
  location                    = var.region
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id

  sku_name = "standard"

  # access_policy {
  #   tenant_id = var.tenant_id
  #   object_id = var.appservice_msi

  #   secret_permissions = [
  #     "get",
  #     "list"
  #   ]

  #   storage_permissions = [
  #     "get",
  #   ]
  # }

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     secret_permissions = [
#       "get",
#       "list",
#       "set"
#     ]

#     storage_permissions = [
#       "get",
#     ]
#   }

#   network_acls {
#     default_action = "Allow"
#     bypass         = "AzureServices"
#   }

#   tags = {
#     environment = var.environment
#   }
# }
}