#-----storage\variables.tf----#

variable "environment" {
  type        = string
  description = "Environment name(dev,test,prod)"
}

variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "region" {
  type        = string
  description = "Azure region(North Europe, West Europe)"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}