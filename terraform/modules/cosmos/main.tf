#----cosmos\main.tf------#
resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmosdb_name
  location            = var.region
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  tags = {
      environment = var.environment
  }

  geo_location {
    prefix            = "${var.cosmosdb_name}-customid"
    location          = var.region
    failover_priority = 0
  }
}