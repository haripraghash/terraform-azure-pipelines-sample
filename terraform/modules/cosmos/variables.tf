#----cosmos\variables.tf------#
variable "cosmosdb_name" {
  type      = string
  description = "Cosmos db name"
}

variable "region" {
  type      = string
  description = "Region"
}

variable "resource_group_name" {
  type      = string
  description = "Resource group name"
}

variable "environment" {
  type      = string
  description = "Environment"
}
