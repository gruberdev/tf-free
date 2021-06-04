output "gcp_public_ip" {
  description = "GCP VM Compute IPv4 Public Address"
  value       = module.google_cloud.machine_ip
  sensitive   = true
}

output "aws_ec2_public_ip" {
  description = "AWS EC2 IPv4 Public Address"
  value       = module.aws.ec2_public_ip
  sensitive   = true
}

output "aws_ec2_ipv6_addresses" {
  description = "AWS EC2 IPv6 Public Address"
  value       = module.aws.ec2_ipv6_addresses
  sensitive   = true
}

output "aws_ec2_private_ip" {
  description = "AWS EC2 assigned Private IP"
  value       = module.aws.ec2_private_ip
  sensitive   = true
}

output "aws_ec2_password_data" {
  description = "List of Base-64 encoded encrypted password data for AWS EC2 instances"
  value       = module.aws.ec2_password_data
  sensitive   = true
}

