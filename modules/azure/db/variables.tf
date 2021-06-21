variable "resource_group_name" {
  description = "Name for the resource group holding resources for this example"
  type        = string
}

variable "location" {
  description = "The Azure region in which to deploy this sample"
  type        = string
}

variable "postfix" {
  description = "A postfix string to centrally mitigate resource name collisions."
  type        = string
  default     = "resource"
}