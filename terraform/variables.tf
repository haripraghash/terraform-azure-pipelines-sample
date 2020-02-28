variable "environment" {
  type        = string
  description = "Environment name(dev,test,prod)"
}

variable "short_region" {
  type        = string
  description = "Short region name(eun,euw)"
}

variable "region" {
  type        = string
  description = "Azure region(North Europe, West Europe)"
}

variable "tenant_id" {
  type        = string
  description = "Azure active directory tenant id"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription id"
}
