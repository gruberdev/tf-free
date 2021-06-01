output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.ec2.public_ip
  sensitive   = true
}
