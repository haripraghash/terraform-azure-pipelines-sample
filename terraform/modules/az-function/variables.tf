#------az-function\variables.tf---------#

variable "app_service_plan" {
  type      = string
  description = "App service plan name"
}

variable "region" {
  type      = string
  description = "Region"
}

variable "resource_group_name" {
  type      = string
  description = "Resource group name"
}

variable "function_app_name" {
  type      = string
  description = "Function app name"
}

variable "storage_key" {
  type      = string
  description = "Function app storage connection string"
}

variable "app_insights_instrumentation_key" {
  type      = string
  description = "Application insights instrumention key"
}

variable "cosmoskeyuri" {
  type      = string
  description = "Cosmos key key vault uri"
}

variable "cosmosendpointuri" {
  type      = string
  description = "Cosmos endpoint key vault uri"
}

