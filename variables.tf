variable "gcp_project_id" {
  type        = string
  default     = "test"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
  validation {
    condition     = can(regex("^[a-z0-9][-a-z0-9]*[a-z0-9]$", var.gcp_project_id))
    error_message = "Error: Your Google Cloud Project ID seems to have an invalid value."
  }
}

variable "gcp_project_region" {
  type        = string
  default     = "us-west1"
  description = "Zone location of your instance, you can choose a region on [GCP's Official Documentation](https://cloud.google.com/compute/docs/regions-zones#available) - [Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#zone)"
  validation {
    condition     = can(index(["us-west1", "us-central1", "us-east1"], var.gcp_project_region))
    error_message = "Error: Only some U.S. regions are available regarding the free offer of GCP Compute VM instances."
  }
}

variable "gcp_instance_name" {
  type        = string
  default     = "gcp-machine"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
  validation {
    condition     = can(regex("^[a-z0-9][-a-z0-9]*[a-z0-9]$", var.gcp_instance_name))
    error_message = "Error: The instance name can contain only dashes, lowercase letters, and numbers. It must be at least 2 characters and can neither start nor end with a dash."
  }
}

variable "gcp_storage_permissions" {
  type        = string
  default     = "publicread"
  description = "See all available values for the parameter at [Predefined ACL's on GCS Permissions](https://cloud.google.com/storage/docs/access-control/lists#predefined-acl)"
  validation {
    condition     = can(index(["private", "bucketownerread", "bucketOwnerfullcontrol", "projectprivate", " authenticateread", "publicread", "publicreadwrite"], var.gcp_storage_permissions))
    error_message = "Error: Invalid permissions set for GCS Bucket. Please adjust it according to the documentation.."
  }
}

variable "aws_default_region" {
  type        = string
  default     = "us-east-1"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "backend_destroy" {
  type        = string
  default     = "false"
  description = "Allows destroying a previously provisioned S3 Remote Backend. See more at [tf-free's Backend Documentation]()"
  validation {
    condition     =can(index(["false", "true"], var.backend_destroy))
    error_message = "Error: Only 'true' or 'false' input as a string are acceptable values to this variable."
  }
}

variable "backend_stage" {
  type        = string
  default     = "test"
  description = "Stages possible for Backend."
}
