variable "should_be_created" {
  description = "Should the VPC be created?"
  type        = bool
  default     = true
}

variable "name" {
  description = "The Name of the VPC"
  type        = string
  default     = "Free Tier VPC"
}

variable "cidr_block" {
  description = "The IPv4 CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Should instances in the VPC get public DNS hostnames?"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should the DNS resolution be supported?"
  type        = bool
  default     = true
}

