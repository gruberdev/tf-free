
variable "google_project" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"

}

variable "gcp_project_region" {
  type        = string
  default     = "us-west1"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"

}

variable "gcp_instance_name" {
  type        = string
  default     = "gcp-machine"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"

}
