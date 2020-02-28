#--------application-insights\main.tf-------#

resource "azurerm_application_insights" "appinsights" {
  name                = var.app_insights_name
  location            = var.region
  resource_group_name = var.resource_group_name
  application_type    = "web"
  tags = {
    environment = var.environment
  }
}