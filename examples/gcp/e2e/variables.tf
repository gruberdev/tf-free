variable "gcp_instance_name" {
  type        = string
  default     = "example-machine"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "gcp_project_region" {
  type = string
}

variable "google_project" {
  type    = string
  default = ""
}
variable "main_network_name" {
  type    = string
  default = ""
}


