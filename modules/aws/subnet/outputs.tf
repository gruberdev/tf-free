output "id" {
  description = "The ID of the Public Subnet"
  value       = concat(aws_subnet.public_subnet.*.id, [""])[0]
}

output "arn" {
  description = "The ARN of the Public Subnet"
  value       = concat(aws_subnet.public_subnet.*.arn, [""])[0]
}
