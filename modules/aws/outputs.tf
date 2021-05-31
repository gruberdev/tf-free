output "ec2_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.ec2.public_ip
}

output "ec2_ipv6_addresses" {
  description = "List of assigned IPv6 addresses of instances"
  value       = module.ec2.ipv6_addresses
}

output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = module.ec2.private_ip
}

output "ec2_password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = module.ec2.password_data
}

output "ec2_key_name" {
  description = "List of key names of instances"
  value       = module.ec2.names
}
