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
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availability Zone of the Public Subnet | `string` | `"us-east-1a"` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The IPv4 CIDR block of the Public Subnet | `string` | `"10.0.1.0/24"` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the Public Subnet | `string` | `"Free Tier Public Subnet"` | no |
| <a name="input_should_be_created"></a> [should\_be\_created](#input\_should\_be\_created) | Should the Public Subnet be created? | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Public Subnet |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Public Subnet |
<!-- END_TF_DOCS -->
