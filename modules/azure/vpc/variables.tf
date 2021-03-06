variable "resource_group_name" {
  type        = string
  description = "The name which should be used for a specific resource group. [Azure Terraform Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#name)"
}

variable "location" {
  type        = string
  description = "Azure's specific deployment location. [Azure Terraform Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#location)"
}
