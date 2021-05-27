variable "route_table_should_be_created" {
  description = "Should the Route Table be created?"
  type        = bool
  default     = true
}

variable "route_table_name" {
  description = "The Name of the Route Table"
  type        = string
  default     = "Free Tier Route Table"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the Public Subnet"
  type        = string
}
