output "id" {
  description = "The ID of the EC2"
  value       = concat(aws_instance.ec2.*.id, [""])[0]
}

output "arn" {
  description = "The ARN of the EC2"
  value       = concat(aws_instance.ec2.*.arn, [""])[0]
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.ec2.*.public_ip
  sensitive   = true
}

output "ipv6_addresses" {
  description = "List of assigned IPv6 addresses of instances"
  value       = aws_instance.ec2.*.ipv6_addresses
  sensitive   = true
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.ec2.*.private_ip
  sensitive   = true
}

output "password_data" {
  description = "List of Base-64 encoded encrypted password data for the instance"
  value       = aws_instance.ec2.*.password_data
  sensitive   = true
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.ec2.*.public_dns
}

output "names" {
  description = "List of key names of instances"
  value       = aws_instance.ec2.*.key_name
}

output "security_group_id" {
  description = "List of key names of instances"
  value       = aws_security_group.security_group.id
}
