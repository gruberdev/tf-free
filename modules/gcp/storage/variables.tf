variable "project_id" {
  type        = string
  sensitive   = true
  description = "Google Cloud SDK project's ID number identifier. [Indetifying projects | GCP Docs](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects)"
}
variable "name" {
  type        = string
  default     = "regionaltftest"
  description = "Public name of your storage bucket on GCP. [Naming guidelines for Storage Buckets | GCP Docs](https://cloud.google.com/storage/docs/naming-buckets)"
}

variable "storage_class" {
  type        = string
  default     = "STANDARD"
  description = "[Storage Bucket Classes | GCP Docs](https://cloud.google.com/storage/docs/storage-classes) | [GCP Storage Classes on Terraform Provider](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/storage_bucket#storage_class)"
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
  default     = "us-west1"
  description = "Identifier for default resource location based on GCP region naming convention. [Regions and Zones | GCP Docs](https://cloud.google.com/compute/docs/regions-zones)"
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
