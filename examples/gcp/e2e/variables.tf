variable "gcp_project_region" {
  type        = string
}

variable "gcp_project_id" {
  type        = string
}

variable "gcp_network_name" {
  type        = string
}

variable "gcp_bucket_name" {
  type        = string
}

variable "gcp_storage_permissions" {
  type        = string 
  default = "publicread"
}

variable "gcp_instance_name" {
  type        = string
}