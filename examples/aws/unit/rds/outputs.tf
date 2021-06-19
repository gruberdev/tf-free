

output "db_port" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = concat(module.rds.*.db_default_instance_port, [""])[0]
  
}
output "db_id" {
  description = "List of key names of instances"
  value       = concat(module.rds.*.db_default_instance_id, [""])[0]
}


