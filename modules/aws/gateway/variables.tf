variable "should_be_created" {
  description = "Should the Internet Gateway be created?"
  type        = bool
  default     = true
}

variable "name" {
  description = "The Name of the Internet Gateway"
  type        = string
  default     = "Free Tier Internet Gateway"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
