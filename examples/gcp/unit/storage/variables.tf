variable "gcp_project_id" {
  type = string
}

variable "gcp_project_region" {
  type        = string
  default     = "us-west1"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "bucket_name" {
  type        = string
  default     = "my-bucket"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
variable "bucket_permissions" {
  type        = string
  default     = "publicread"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
