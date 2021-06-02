<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| availability\_zone | The Availability Zone of the Public Subnet | `string` | `"us-east-1a"` |
| cidr\_block | The IPv4 CIDR block of the Public Subnet | `string` | `"10.0.1.0/24"` |
| name | The Name of the Public Subnet | `string` | `"Free Tier Public Subnet"` |
| should\_be\_created | Should the Public Subnet be created? | `bool` | `true` |
| vpc\_id | The ID of the VPC | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the Public Subnet |
| id | The ID of the Public Subnet |
<!-- END_TF_DOCS -->
