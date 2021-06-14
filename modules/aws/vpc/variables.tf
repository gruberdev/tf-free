variable "name" {
  description = "Region for AWS resources"
  type        = string
  default     = "main-vpc"
}

variable "cidr" {
 type = string
 default = "10.99" //10.99.0.0/18
}

variable "region" {
 description = "Region for AWS resources"
 type = string
}

variable "db_group_create" {
 type = bool
 default = true
}

variable "vpn" {
 type = bool
 default = true
}
variable "nat" {
 type = bool
 default = true
}