#----terraform\modules\keyvault-secret\variables.tf----#

variable "secret_name" {
  type = string
  description = "Name of the secret"
}

variable "secret_value" {
  type = string
  description = "Value of the secret"
}

variable "environment" {
  type      = string
  description = "Environment"
}

variable "keyvault_name" {
  type      = string
  description = "Key vault name"
}

variable "resource_group_name" {
  type      = string
  description = "Resource group name"
}

variable "keyvault_id" {
  type      = string
  description = "Key vault id"
}


