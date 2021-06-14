variable "gcp_network_name" {
  type    = string
}

variable "gcp_project_region" {
  type        = string
}


variable "gcp_ipv4_name" {
  type = string
}

variable "gcp_project_id" {
  type      = string
  sensitive = true
}

