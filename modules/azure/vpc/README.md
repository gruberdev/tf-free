<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| location | Azure's specific deployment location. [Azure Terraform Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#location) | `string` | n/a |
| resource\_group\_name | The name which should be used for a specific resource group. [Azure Terraform Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#name) | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The id of the newly created vNet |
| vpc\_location | The location of the newly created vNet |
| vpc\_name | The name of the newly created vNet |
| vpc\_space | The address space of the newly created vNet |
<!-- END_TF_DOCS -->
