output "ec2_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.ec2.*.public_ip
  sensitive   = true
}

output "ec2_ipv6_addresses" {
  description = "List of assigned IPv6 addresses of instances"
  value       = module.ec2.*.ipv6_addresses
  sensitive   = true
}

output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = module.ec2.*.private_ip
  sensitive   = true
}

output "ec2_password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = module.ec2.*.password_data
  sensitive   = true
}

output "ec2_key_name" {
  description = "List of key names of instances"
  value       = module.ec2.*.names
  sensitive   = true
}

output "db_id" {
  description = "List of key names of instances"
  value       = module.rds.*.db_default_instance_id
  sensitive   = true
}
