output "vpc_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.example.id
}

output "vpc_name" {
  description = "The name of the newly created vNet"
  value       = azurerm_virtual_network.example.name
}

output "vpc_location" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.example.location
}

output "vpc_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.example.address_space
}
