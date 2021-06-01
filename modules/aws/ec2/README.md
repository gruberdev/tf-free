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
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.ec2_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The Amazon Machine Image | `string` | `"ami-04b9e92b5572fa0d1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The EC2 Instance type | `string` | `"t2.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the EC2 | `string` | `"Free Tier EC2"` | no |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | The ID of the Public Subnet | `string` | n/a | yes |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The Description of the EC2 Security Group | `string` | `"Free Tier EC2 Security Group"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The Name of the EC2 Security Group | `string` | `"Free Tier EC2 Security Group"` | no |
| <a name="input_seed_data"></a> [seed\_data](#input\_seed\_data) | The local path to the SSH Public Key | `string` | `""` | no |
| <a name="input_should_be_created"></a> [should\_be\_created](#input\_should\_be\_created) | Should the EC2 be created? | `bool` | `true` | no |
| <a name="input_ssh_name"></a> [ssh\_name](#input\_ssh\_name) | The SSH Key Name | `string` | `"free-tier-ec2-key"` | no |
| <a name="input_ssh_public"></a> [ssh\_public](#input\_ssh\_public) | The local path to the SSH Public Key | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the EC2 |
| <a name="output_id"></a> [id](#output\_id) | The ID of the EC2 |
| <a name="output_ipv6_addresses"></a> [ipv6\_addresses](#output\_ipv6\_addresses) | List of assigned IPv6 addresses of instances |
| <a name="output_names"></a> [names](#output\_names) | List of key names of instances |
| <a name="output_password_data"></a> [password\_data](#output\_password\_data) | List of Base-64 encoded encrypted password data for the instance |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | List of private IP addresses assigned to the instances |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | List of public IP addresses assigned to the instances, if applicable |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | List of key names of instances |
<!-- END_TF_DOCS -->
