variable "name" {
  description = "The Name of the Internet Gateway"
  type        = string
  default     = "Free Tier Internet Gateway"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  sensitive   = true
  type        = string
}
