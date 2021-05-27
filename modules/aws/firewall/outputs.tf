output "route_table_id" {
  description = "The ID of the Route Table"
  value       = concat(aws_route_table.route_table.*.id, [""])[0]
}
