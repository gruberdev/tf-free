
variable "gcp_project_id" {
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

variable "aws_account_id" {
  type        = string
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "aws_account_key" {
  type        = string
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "aws_default_region" {
  default     = "us-west-2"
  type        = string
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
