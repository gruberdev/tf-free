variable "security_group_id" {
  description = "AWS Profile"
  type        = string
}

variable "name" {
  description = "Region for AWS resources"
  type        = string
  default     = "tf-free-database"
}

variable "engine_version" {
  description = "The SSH Key Name"
  type        = string
  default     = "13.2"
}

variable "db_engine" {
  description = "The local path to the SSH Public Key"
  type        = string
  default     = "postgres"
}

variable "db_user" {
  description = "Region for AWS resources"
  default     = "default-user"
  type        = string
}

variable "db_password" {
  description = "Region for AWS resources"
  default     = "for-the-love-of-god-change-me"
  type        = string
}

variable "vpc_group_id" {
  description = "Region for AWS resources"
  default     = ""
  type        = string
}

variable "license" {
  description = "Region for AWS resources"
  default     = "general-public-license"
  type        = string
}

variable "db_instance_type" {
  description = "Instance type for database"
  type        = string
  default     = "db.t2.micro"
}
