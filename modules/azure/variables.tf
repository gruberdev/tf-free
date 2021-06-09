variable "resource_group_name" {
  type    = string
  default = "my-azure-group"
}

variable "azure_location" {
  type    = string
  default = "West Europe"
}

variable "database_name" {
  type    = string
  default = "myapp"
}

variable "database_db_name" {
  type    = string
  default = "mydatabase"
}

variable "database_user" {
  type    = string
  default = "mradministrator"
}

variable "database_password" {
  type    = string
  default = "P@ssw0rd12345!"
}

variable "ldns_server" {
  type    = string
  default = "P@ssw0rd12345!"
}

variable "wdns_server" {
  type    = string
  default = "P@ssw0rd12345!"
}
