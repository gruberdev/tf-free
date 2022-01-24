variable "resource_group_name" {
  type    = string
  default = "my-azure-group"
}

variable "location" {
  type    = string
  default = "East US"
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
  default = "uniquename"
}

variable "wdns_server" {
  type    = string
  default = "uniquename2"
}

variable "windows_name" {
  type    = string
  default = "windows-pc"
}

variable "linux_name" {
  type    = string
  default = "linux-pc"
}

variable "storage_account_name" {
  type    = string
  default = "tf-free-sa"
}