module "database" {
  source              = "Azure/database/azurerm"
  version             = "1.1.0"
  resource_group_name = var.name
  location            = var.location
  db_name             = var.db_name
  sql_admin_username  = var.sql_user
  sql_password        = var.sql_password

  tags = {
    environment = var.environment
  }
}
