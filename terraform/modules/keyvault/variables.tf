#-----------keyvault\variables.tf---------#

variable "region" {
  type        = string
  description = "Azure region(North Europe, West Europe)"
}

variable "tenant_id" {
  type        = string
  description = "Azure active directory tenant id"
}

variable "environment" {
  type        = string
  description = "Environment name(dev,test,prod)"
}

variable "keyvault_name" {
  type        = string
  description = "Key vault name"
}

variable "appservice_msi" {
  type        = string
  description = "App service MSI service principal id"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
