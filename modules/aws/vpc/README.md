<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| vpc | terraform-aws-modules/vpc/aws | n/a |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| cidr | n/a | `string` | `"10.99"` |
| db\_group\_create | n/a | `bool` | `true` |
| name | Region for AWS resources | `string` | `"main-vpc"` |
| nat | n/a | `bool` | `true` |
| region | Region for AWS resources | `string` | n/a |
| vpn | n/a | `bool` | `true` |

### Outputs

| Name | Description |
|------|-------------|
| cidr\_block | n/a |
| database\_subnets | n/a |
| id | n/a |
| public\_subnets | n/a |
<!-- END_TF_DOCS -->