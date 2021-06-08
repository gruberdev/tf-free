output "id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.internet_gateway.*.id, [""])[0]
}
