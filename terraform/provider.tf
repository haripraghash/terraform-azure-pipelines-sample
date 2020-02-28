provider "azurerm" {
    version         = ">=2.0.0"
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    storage_use_azuread = true
    features {}
 }

 terraform {
  backend "azurerm" {
    # resource_group_name   = ""
    # storage_account_name  = ""
    # container_name        = ""
    # key                   = ""
  }
}