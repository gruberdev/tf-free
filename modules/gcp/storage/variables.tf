variable "project_id" {
  type        = string
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
variable "name" {
  type        = string
  default     = "regional-buckeet"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "storage_class" {
  type        = string
  default     = "STANDARD"
  description = "[GCP Docs on Storage Bucket Classes](https://cloud.google.com/storage/docs/storage-classes) | [GCP Storage Classes on Terraform Provider](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/storage_bucket#storage_class)"
}

variable "enable_destroy" {
  type        = bool
  default     = true
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
}

variable "permissions" {
  type        = string
  default     = "publicread"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "firestore_name" {
  type        = string
  default     = "my-firestore"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "fire_size" {
  type        = number
  default     = 5
  description = "Your Firestore Database size in GB's."
}

variable "table_name" {
  type        = string
  default     = "share1"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "network_name" {
  type        = string
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
