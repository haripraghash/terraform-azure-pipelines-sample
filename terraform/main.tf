#-----dev\main.tf-------#

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


