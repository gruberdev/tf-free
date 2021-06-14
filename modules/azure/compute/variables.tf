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

variable "linux_hostname" {
  type    = string
  default = "mywinvm"
}

variable "linux_password" {
  type    = string
  default = "mywinvj33j4k3"
}
variable "linux_dns_server" {
  type    = string
  default = "linsimplevmips"
}

variable "subnet_id" {
  type    = string
  default = "dev"
}

variable "resource_group_name" {
  type = string
}
