#----resource-group\main.tf-----#

resource "azurerm_resource_group" "app-resource-group" {
  name     = var.resource_group_name
  location = var.region

  tags = {
      envionment = var.environment
  }
}
