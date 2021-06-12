variable "profile" {
  description = "AWS Profile"
  type        = string
  default     = "terraform"
}

variable "region" {
  description = "Region for AWS resources"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ssh_name" {
  description = "The SSH Key Name"
  type        = string
  default     = "free-tier-ec2-key"
}

variable "ec2_ssh_public" {
  description = "The local path to the SSH Public Key"
  type        = string
  sensitive   = true
  default     = "~/.ssh-temp/id_rsa.pub"
}

variable "rds_user" {
  description = "Region for AWS resources"
  type        = string
  sensitive   = true
  default     = "testing"
}

variable "rds_password" {
  description = "Region for the RDS database"
  type        = string
  sensitive   = true
  default     = "testingdatabase89372934279"
}
