variable "name" {
  description = "The Name of the Route Table"
  type        = string
  default     = "Free Tier Route Table"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  sensitive   = true
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the Public Subnet"
  sensitive   = true
  type        = string
}
