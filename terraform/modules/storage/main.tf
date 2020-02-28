#-----storage\main.tf----#
resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.region
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  account_kind              = "StorageV2"
  enable_https_traffic_only = "true"
  blob_properties {
   delete_retention_policy {
     days = 10
   }
  }
   
  tags = {
    environment = var.environment
  }
}