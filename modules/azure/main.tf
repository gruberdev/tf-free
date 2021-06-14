
resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  depends_on          = [azurerm_resource_group.default]
  resource_group_name = var.resource_group_name
  location = var.location
  source              = "./vpc"
}

/* module "database" {
  source       = "./db"
  location     = var.location
  name         = var.database_name
  db_name      = var.database_db_name
  sql_username = var.database_user
  depends_on = [
    azurerm_resource_group.default,
    networking.default
  ]

} */

module "compute" {
  source             = "./compute"
  resource_group_name = var.resource_group_name
  windows_hostname   = var.windows_name
  linux_hostname     = var.linux_name
  windows_dns_server = var.wdns_server
  linux_dns_server   = var.ldns_server
  subnet_id          = module.networking.vpc_id
  depends_on = [azurerm_resource_group.default]
}
