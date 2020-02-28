#-------dev\outputs.tf-------#
output "app_insights_key" {
  value = module.function_app_app_insights.instrumentation_key
}

output "cosmos_primary_key" {
  value = module.cosmos_db.cosmos_primary_key
}

output "cosmos-db-endpoint" {
  value = module.cosmos_db.cosmos-db-endpoint
}

output "function-app-msi" {
  value = module.function_app.msi
}
