variable "gcp_network_name" {
  type    = string
  default = ""
}

variable "gcp_project_region" {
  type        = string
  default     = "us-west1"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "gcp_project_id" {
  type    = string
  default = ""
}

variable "gcp_ipv4_name" {
  type    = string
  default = ""
}
