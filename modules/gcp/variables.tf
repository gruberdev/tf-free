variable "google_project" {
  type = string
  default = ""
}

variable "gcp_project_id" {
  description = "Google Cloud SDK project's ID number identifier. [Indetifying projects | GCP Docs](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects)"
  type      = string
  sensitive = true
}

variable "instance_name" {
  type        = string
  default     = "example-machine"
  description = "GCP Compute Instance Name. [Resource Naming Convention | GCP Compute Docs](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "project_region" {
  type        = string
  default     = "us-west1"
  description = "Identifier for default resource location based on GCP region naming convention. [Regions and Zones | GCP Docs](https://cloud.google.com/compute/docs/regions-zones)"
}

variable "network_name" {
  type    = string
  default = "gcp-network2"
  description = "Creates and names a VPC network. A VPC network is not the same as a GCP Subnetwork, see: [VPC Network Overview | GCP Docs](https://cloud.google.com/vpc/docs/vpc#vpc_networks_and_subnets)"
}

variable "instance_ipv4_name" {
  type    = string
  default = "ipv4-instance-gcp"
}

variable "bucket_name" {
  type        = string
  default     = "averynoncommonbuck"
  description = "Public name of your storage bucket on GCP. [Naming guidelines for Storage Buckets | GCP Docs](https://cloud.google.com/storage/docs/naming-buckets)"
}

variable "permissions" {
  type        = string
  default     = "publicread"
  description = "Your instance's network on GCP."
}

variable "firestore_name" {
  type        = string
  default     = "firestore-db-1"
  description = "Your instance's network on GCP."
}
