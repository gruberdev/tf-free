
variable "gcp_instance_name" {
  type = string
}

variable "gcp_project_region" {
  type = string
}

variable "gcp_project_id" {
  type      = string
  sensitive = true
}
