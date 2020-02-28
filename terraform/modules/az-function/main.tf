#-----az-function\main.tf------#
resource "azurerm_app_service_plan" "serviceplan" {
  name                = var.app_service_plan
  location            = var.region
  resource_group_name = var.resource_group_name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "functionapp" {
  name                      = var.function_app_name
  location                  = var.region
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = azurerm_app_service_plan.serviceplan.id
  storage_connection_string = var.storage_key
  https_only                = true
  version                   = "~3"
  identity {
      type = "SystemAssigned"
  }
  app_settings = {
      WEBSITE_RUN_FROM_PACKAGE = "1"
      FUNCTIONS_WORKER_RUNTIME = "dotnet"
      WEBSITE_NODE_DEFAULT_VERSION = "10.14.1"
      APPINSIGHTS_INSTRUMENTATIONKEY = var.app_insights_instrumentation_key
      Cosmos_Endpoint = join("",["@Microsoft.KeyVault(SecretUri=]", var.cosmosendpointuri, ")"])
      Cosmos_Key = join("",["@Microsoft.KeyVault(SecretUri=]", var.cosmoskeyuri, ")"])
      Cosmos_DatabaseId = "CustomersDatabase"
      Cosmos_ContainerId = "Customers"
  }
}