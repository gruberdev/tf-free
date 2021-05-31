output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_db_instance.rds.address
}
