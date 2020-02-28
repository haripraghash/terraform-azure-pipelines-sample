#--------application-insights\variables.tf---------#


variable "region" {
  type      = string
  description = "Region"
}

variable "resource_group_name" {
  type      = string
  description = "Resource group name"
}

variable "app_insights_name" {
  type      = string
  description = "App insights name"
}

variable "environment" {
  type      = string
  description = "Environment(Dev, Test etc)"
}