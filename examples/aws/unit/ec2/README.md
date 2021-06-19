<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| ec2 | ../../../../modules/aws/ec2 |  |
| vpc | ../../../../modules/aws/vpc |  |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| ami\_id | n/a | `string` | n/a |
| aws\_default\_region | n/a | `string` | n/a |
| ec2\_enable | n/a | `bool` | `true` |
| ssh\_name | n/a | `string` | n/a |
| ssh\_public | n/a | `string` | n/a |
| subnet\_region | n/a | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| public\_ip | List of public IP addresses assigned to the instances, if applicable |
<!-- END_TF_DOCS -->
