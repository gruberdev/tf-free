<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| name | The Name of the Internet Gateway | `string` | `"Free Tier Internet Gateway"` |
| should\_be\_created | Should the Internet Gateway be created? | `bool` | `true` |
| vpc\_id | The ID of the VPC | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Internet Gateway |
<!-- END_TF_DOCS -->
