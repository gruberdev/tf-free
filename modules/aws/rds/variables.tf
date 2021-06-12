variable "name" {
  description = "Region for AWS resources"
  type        = string
  default     = "databasetf"
}

variable "engine_version" {
  description = "The SSH Key Name"
  type        = string
  default     = "12.6"
}

variable "db_engine" {
  description = "The local path to the SSH Public Key"
  type        = string
  default     = "postgres"
}

variable "db_user" {
  description = "Region for AWS resources"
  default     = "default-user"
  sensitive   = true
  type        = string
}

variable "db_password" {
  description = "Region for AWS resources"
  sensitive   = true
  default     = "for-the-love-of-god-change-me"
  type        = string
}


variable "license" {
  description = "Region for AWS resources"
  default     = "postgresql-license"
  type        = string
}

variable "db_instance_type" {
  description = "Instance type for database"
  type        = string
  default     = "db.t2.micro"
}

variable "subnet_group_name" {
  description = "Instance type for database"
  sensitive   = true
  type        = string
  default     = "subnet-db"
}


variable "db_security_group_name" {
  description = "Instance type for database"
  type        = string
  sensitive   = true
  default     = "security-db"
}

