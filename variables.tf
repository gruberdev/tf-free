
variable "google_project" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
  validation {
    condition     = can(regex("[a-z]([-a-z0-9]*[a-z0-9])?", var.gcp_project_id))
    error_message = "Error: Your static IP address resource name is invalid, adjust it to GCP's resources naming convention."
  }
}

variable "gcp_project_region" {
  type        = string
  default     = "us-west1"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
  validation {
    condition     = can(regex("[a-z]([-a-z0-9]*[a-z0-9])?", var.gcp_project_region))
    error_message = "Error: Your static IP address resource name is invalid, adjust it to GCP's resources naming convention."
  }
}

variable "gcp_instance_name" {
  type        = string
  default     = "gcp-machine"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
  validation {
    condition     = can(regex("[a-z]([-a-z0-9]*[a-z0-9])?", var.gcp_project_region))
    error_message = "Error: Your static IP address resource name is invalid, adjust it to GCP's resources naming convention."
  }
}
