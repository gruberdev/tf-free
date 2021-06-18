output "db_address" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.rds.*.db_default_instance_address
  sensitive   = true
}

output "db_username" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.rds.*.db_default_instance_username
  sensitive   = true
}

output "db_password" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.rds.*.db_default_instance_password
  sensitive   = true
}

output "db_port" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.rds.*.db_default_instance_port
}
output "db_id" {
  description = "List of key names of instances"
  value       = module.rds.*.db_default_instance_id
}
