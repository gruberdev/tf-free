output "gcp_public_ip" {
  value     = module.google_cloud.machine_ip
  sensitive = true
}

output "aws_ec2_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.aws.ec2_public_ip
  sensitive   = true
}

output "aws_ec2_ipv6_addresses" {
  description = "List of assigned IPv6 addresses of instances"
  value       = module.aws.ec2_ipv6_addresses
  sensitive   = true
}

output "aws_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = module.aws.ec2_private_ip
  sensitive   = true
}

output "aws_ec2_password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = module.aws.ec2_password_data
  sensitive   = true
}

output "aws_ec2_names" {
  description = "List of key names of instances"
  value       = module.aws.ec2_names
}
