locals {
  resource_group_name = join("-",["acme", var.environment, var.short_region, "resgrp"])
  function_app_storage_name = join("", ["acmefunction", var.environment, var.short_region, "stor"])
  function_app_app_insights_name = join("-", ["acme", var.environment, var.short_region, "function-appinsights"])
  app_service_plan_name = join("-", ["acme", var.environment, var.short_region, "function-appserviceplan"])
  function_app_name = join("-", ["acme", var.environment, var.short_region, "function"])
  cosmosdb_name = join("", ["acme", var.environment, var.short_region, "cosmos"])
  keyvault_name = join("", ["acme", var.environment, var.short_region, "vault"])
}