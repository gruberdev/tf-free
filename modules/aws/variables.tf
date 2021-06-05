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
  default     = "aws.pub"
}

variable "account_id" {
  description = "Region for AWS resources"
  type        = string
}

variable "account_key" {
  description = "Region for AWS resources"
  type        = string
}

variable "rds_user" {
  description = "Region for AWS resources"
  type        = string
  default     = "testing"
}

variable "rds_password" {
  description = "Region for AWS resources"
  type        = string
  default     = "testingdatabase89372934279"
}
