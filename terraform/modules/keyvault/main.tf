#------------keyvault\main.tf---------#
resource "azurerm_key_vault" "example" {
  name                        = var.keyvault_name
  location                    = var.region
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.appservice_msi

    secret_permissions = [
      "get",
      "list"
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = {
    environment = var.environment
  }
}