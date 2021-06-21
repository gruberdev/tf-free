provider "azurerm" {
  features {}
}

module "postgres_db" {
  source = "../../../../modules/azure/db"
}