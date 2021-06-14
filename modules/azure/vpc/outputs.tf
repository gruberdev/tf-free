output "vpc_id" {
  description = "The id of the newly created vNet"
  value       = module.network.vnet_id
}

output "vpc_name" {
  description = "The name of the newly created vNet"
  value       = module.network.vnet_name
}

output "vpc_location" {
  description = "The location of the newly created vNet"
  value       = module.network.vnet_location
}

output "vpc_space" {
  description = "The address space of the newly created vNet"
  value       = module.network.address_space
}
