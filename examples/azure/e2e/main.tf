provider "azurerm" {
  features {}
}

module "azure" {
  source           = "../../../modules/azure"
  location         = ""
  database_name    = ""
  database_db_name = ""
  database_user    = ""
}
