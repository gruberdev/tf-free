<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The IPv4 CIDR block of the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Should instances in the VPC get public DNS hostnames? | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Should the DNS resolution be supported? | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the VPC | `string` | `"Free Tier VPC"` | no |
| <a name="input_should_be_created"></a> [should\_be\_created](#input\_should\_be\_created) | Should the VPC be created? | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the VPC |
| <a name="output_cidr_block"></a> [cidr\_block](#output\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->
