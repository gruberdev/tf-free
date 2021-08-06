module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = var.resource_group_name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = [var.linux_dns_server] // change to a unique name per datacenter region
  vnet_subnet_id      = var.subnet_id          //module.network.vnet_subnets[0]

  //depends_on = [azurerm_resource_group.example]
}

module "windowsservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = var.resource_group_name
  is_windows_image    = true
  vm_hostname         = var.windows_hostname // line can be removed if only one VM module per resource group
  admin_password      = var.windows_password
  vm_os_simple        = "WindowsServer"
  public_ip_dns       = [var.windows_dns_server] // change to a unique name per datacenter region
  vnet_subnet_id      = var.subnet_id            // module.network.vnet_subnets[0]

  //depends_on = [azurerm_resource_group.example]
}

