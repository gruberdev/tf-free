
variable "instance_name" {
  type        = string
  default     = "example-machine"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "project_region" {
  type        = string
  default     = "us-west1"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "google_project" {
  type    = string
  default = ""
}
variable "network_name" {
  type    = string
  default = "gcp-network"
}
variable "instance_ipv4_name" {
  type    = string
  default = "ipv4-instance-gcp"
}
variable "gcp_project_id" {
  type = string
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
