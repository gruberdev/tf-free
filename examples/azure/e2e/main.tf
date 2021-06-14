provider "azurerm" {
  features {}
}

module "azure" {
  source              = "../../../modules/azure"
  resource_group_name = var.resource_group_name
  location            = var.location
/*   linux_hostname = var.linux_vm
  windows_hostname = var.windows_vm */
}
