
output "sql_name" {
  value = module.database.database_name
}

output "connection_url" {
  value = module.database.connection_string
}

