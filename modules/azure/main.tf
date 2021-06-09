provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.azure_location
}

module "networking" {
  source = "./compute"
}
w
module "database" {
  source       = "./compute"
  location     = var.azure_location
  name         = var.database_name
  db_name      = var.database_db_name
  sql_username = var.database_user
  sql_password = var.database_password
}

module "compute" {
  source             = "./compute"
  windows_hostname   = var.windows_vm_hostname
  linux_hostname     = var.linux_vm_hostname
  windows_dns_server = var.wdns_server
  linux_dns_server   = var.ldns_server
  subnet_id          = var.subnet_id
}
