<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| cidr\_block | The IPv4 CIDR block of the VPC | `string` | `"10.0.0.0/16"` |
| enable\_dns\_hostnames | Should instances in the VPC get public DNS hostnames? | `bool` | `true` |
| enable\_dns\_support | Should the DNS resolution be supported? | `bool` | `true` |
| name | The Name of the VPC | `string` | `"Free Tier VPC"` |
| should\_be\_created | Should the VPC be created? | `bool` | `true` |

### Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the VPC |
| cidr\_block | The CIDR block of the VPC |
| id | The ID of the VPC |
<!-- END_TF_DOCS -->
