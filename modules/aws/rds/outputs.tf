
# Default
output "db_default_instance_address" {
  description = "The address of the RDS instance"
  value       = concat(module.db_default.*.db_instance_address, [""])[0]
}

output "db_default_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = concat(module.db_default.*.db_instance_arn, [""])[0]
}

output "db_default_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = concat(module.db_default.*.db_instance_availability_zone, [""])[0]
}

output "db_default_instance_endpoint" {
  description = "The connection endpoint"
  value       = concat(module.db_default.*.db_instance_endpoint, [""])[0]
}

output "db_default_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = concat(module.db_default.*.db_instance_hosted_zone_id, [""])[0]
}

output "db_default_instance_id" {
  description = "The RDS instance ID"
  value       = concat(module.db_default.*.db_instance_id, [""])[0]
}

output "db_default_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = concat(module.db_default.*.db_instance_resource_id, [""])[0]
}

output "db_default_instance_status" {
  description = "The RDS instance status"
  value       = concat(module.db_default.*.db_instance_status, [""])[0]
}

output "db_default_instance_name" {
  description = "The database name"
  value       = concat(module.db_default.*.db_instance_name, [""])[0]
}

output "db_default_instance_username" {
  description = "The master username for the database"
  value       = concat(module.db_default.*.db_instance_username, [""])[0]
  sensitive   = true
}

output "db_default_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = concat(module.db_default.*.db_instance_password, [""])[0]
  sensitive   = true
}

output "db_default_instance_port" {
  description = "The database port"
  value       = concat(module.db_default.*.db_instance_port, [""])[0]
}

output "db_default_subnet_group_id" {
  description = "The db subnet group name"
  value       = concat(module.db_default.*.db_subnet_group_id, [""])[0]
}

output "db_default_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = concat(module.db_default.*.db_subnet_group_arn, [""])[0]
}

output "db_default_parameter_group_id" {
  description = "The db parameter group id"
  value       = concat(module.db_default.*.db_parameter_group_id, [""])[0]
}

output "db_default_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = concat(module.db_default.*.db_parameter_group_arn, [""])[0]
}

