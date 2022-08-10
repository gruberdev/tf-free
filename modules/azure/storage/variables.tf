variable "resource_group_name" {
  description = "The name of the resource group where the Storage Account will be created."
  type        = string
}

variable "location" {
  description = "The location for the Resource Group and Storage Account."
  type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account."
  default     = "Standard"
  type        = string
}

variable "account_replication_type" {
  description = "The level of redundancy for the Storage Account. Defaults to LRS (locally-redundant storage)."
  default     = "LRS"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account."
  default     = "tf-free-sa"
  type        = string
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "Storage Account names must be between 3 and 24 characters in length."
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.storage_account_name))
    error_message = "Storage Account names must only contain alphanumeric characters and dashes."
  }
}