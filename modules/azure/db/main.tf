module "database" {
  source              = "Azure/database/azurerm"
  resource_group_name = var.name
  location            = var.location
  db_name             = var.db_name
  sql_username        = var.sql_user
  sql_password        = var.sql_password
}

