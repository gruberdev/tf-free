variable "project_id" {
  type        = string
  default     = "-bucket"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
variable "name" {
  type        = string
  default     = "REGIONAL"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "storage_class" {
  type        = string
  default     = "REGIONAL"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "enable_destroy" {
  type        = bool
  default     = true
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
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

variable "firestore_zone" {
  type        = string
  default     = "us-central1-b"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "tier" {
  type        = string
  default     = "BASIC_SSD"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "fire_size" {
  type        = number
  default     = 1024
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
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
