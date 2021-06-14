module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = var.resource_group_name
  address_spaces      = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Sql"],
    "subnet2" : ["Microsoft.Sql"],
    "subnet3" : ["Microsoft.Sql"]
  }

  tags = {
    environment = var.environment
  }

  depends_on = [azurerm_resource_group.example]
}

resource "azurerm_network_security_group" "ssh" {
  name                = "ssh"
  resource_group_name = var.resource_group_name
  location            = var.location

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_route_table" "example" {
  name                = "MyRouteTable"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_route" "example" {
  name                = "acceptanceTestRoute1"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.example.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "vnetlocal"
}
