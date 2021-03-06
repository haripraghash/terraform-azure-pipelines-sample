#-----dev\main.tf-------#

data "azurerm_client_config" "current" {
}

module "app_resource_group" {
   source  = "./modules/resource-group"
   resource_group_name = local.resource_group_name
   region = var.region
   environment = var.environment
 }

 module "function_app_app_insights" {
  source = "./modules/application-insights"
  resource_group_name = module.app_resource_group.resource_group_name
  region = var.region
  environment = var.environment
  app_insights_name = local.function_app_app_insights_name  
}

module "function_app_storage" {
   source  = "./modules/storage"
   resource_group_name = module.app_resource_group.resource_group_name
   storage_account_name = local.function_app_storage_name
   region = var.region
   environment = var.environment
 }

module "function_app" {
  source = "./modules/az-function"
  resource_group_name = module.app_resource_group.resource_group_name
  region = var.region
  app_service_plan = local.app_service_plan_name
  function_app_name = local.function_app_name
  storage_key = module.function_app_storage.storage_account_primary_coonection_string
  app_insights_instrumentation_key = module.function_app_app_insights.instrumentation_key
  cosmoskeyuri = module.keyvault_secret_cosmos_endpoint.secret_id
  cosmosendpointuri = module.keyvault_secret_cosmos_key.secret_id
}

module "keyvault_access_policy_functionap" {
  source = "./modules/keyvault-access-policy"
  resource_group_name = module.app_resource_group.resource_group_name
  keyvault_name = local.keyvault_name
  tenant_id = var.tenant_id
  object_id = module.function_app.msi
  keyvault_id = module.keyvault.keyvault_id
}

module "keyvault_access_policy_current" {
  source = "./modules/keyvault-access-policy"
  resource_group_name = module.app_resource_group.resource_group_name
  keyvault_name = local.keyvault_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  keyvault_id = module.keyvault.keyvault_id
}


module "cosmos_db" {
  source = "./modules/cosmos"
  resource_group_name = module.app_resource_group.resource_group_name
  region = var.region
  environment = var.environment
  cosmosdb_name = local.cosmosdb_name
}

module "keyvault" {
  source = "./modules/keyvault"
  resource_group_name = module.app_resource_group.resource_group_name
  region = var.region
  environment = var.environment
  keyvault_name = local.keyvault_name
  tenant_id = var.tenant_id
  appservice_msi = module.function_app.msi
}

module "keyvault_secret_cosmos_endpoint" {
  source = "./modules/keyvault-secret"
  secret_name = "Cosmos-Endpoint"
  secret_value = module.cosmos_db.cosmos-db-endpoint
  environment = var.environment
  resource_group_name = local.resource_group_name
  keyvault_name = local.keyvault_name
  keyvault_id = module.keyvault.keyvault_id
}

module "keyvault_secret_cosmos_key" {
  source = "./modules/keyvault-secret"
  secret_name = "Cosmos-Key"
  secret_value =  module.cosmos_db.cosmos_primary_key
  environment = var.environment
  resource_group_name = local.resource_group_name
  keyvault_name = local.keyvault_name
  keyvault_id = module.keyvault.keyvault_id
}


