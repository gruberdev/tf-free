variable "gcp_project_id" {
  type = string
}

variable "gcp_project_region" {
  type = string
}

variable "gcp_network_name" {
  type = string
}

variable "bucket_name" {
  type = string
}
variable "bucket_permissions" {
  type    = string
  default = "publicread"
}

/* variable "firestore_name" {
  type = string
} */

variable "gcp_ipv4_name" {
  type = string
}
