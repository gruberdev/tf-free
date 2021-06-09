variable "windows_password" {
  type    = string
  default = "ComplxP@ssw0rd!"
}

variable "windows_hostname" {
  type    = string
  default = "mywinvm"
}

variable "windows_dns_server" {
  type    = string
  default = "winsimplevmips"
}

variable "linux_dns_server" {
  type    = string
  default = "linsimplevmips"
}

variable "group_name" {
  type    = string
  default = "dev"
}

variable "subnet_id" {
  type    = string
  default = "dev"
}
