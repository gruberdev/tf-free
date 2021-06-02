<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| internet\_gateway\_id | The ID of the Internet Gateway | `string` | n/a |
| name | The Name of the Route Table | `string` | `"Free Tier Route Table"` |
| public\_subnet\_id | The ID of the Public Subnet | `string` | n/a |
| should\_be\_created | Should the Route Table be created? | `bool` | `true` |
| vpc\_id | The ID of the VPC | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Route Table |
<!-- END_TF_DOCS -->
