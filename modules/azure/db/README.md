<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| database | Azure/database/azurerm | 1.1.0 |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| db\_name | n/a | `string` | `"mydatabase"` |
| environment | n/a | `string` | `"dev"` |
| location | n/a | `string` | `"westus"` |
| name | n/a | `string` | `"myapp"` |
| sql\_password | n/a | `string` | `"P@ssw0rd12345!"` |
| sql\_user | n/a | `string` | `"mradministrator"` |

### Outputs

| Name | Description |
|------|-------------|
| connection\_url | n/a |
| sql\_name | n/a |
<!-- END_TF_DOCS -->
