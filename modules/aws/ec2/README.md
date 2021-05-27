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
| [aws_security_group.ec2_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_ami"></a> [ec2\_ami](#input\_ec2\_ami) | The Amazon Machine Image | `string` | `"ami-04b9e92b5572fa0d1"` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | The EC2 Instance type | `string` | `"t2.micro"` | no |
| <a name="input_ec2_name"></a> [ec2\_name](#input\_ec2\_name) | The Name of the EC2 | `string` | `"Free Tier EC2"` | no |
| <a name="input_ec2_security_group_description"></a> [ec2\_security\_group\_description](#input\_ec2\_security\_group\_description) | The Description of the EC2 Security Group | `string` | `"Free Tier EC2 Security Group"` | no |
| <a name="input_ec2_security_group_name"></a> [ec2\_security\_group\_name](#input\_ec2\_security\_group\_name) | The Name of the EC2 Security Group | `string` | `"Free Tier EC2 Security Group"` | no |
| <a name="input_ec2_should_be_created"></a> [ec2\_should\_be\_created](#input\_ec2\_should\_be\_created) | Should the EC2 be created? | `bool` | `true` | no |
| <a name="input_ec2_ssh_key_name"></a> [ec2\_ssh\_key\_name](#input\_ec2\_ssh\_key\_name) | The SSH Key Name | `string` | `"free-tier-ec2-key"` | no |
| <a name="input_ec2_ssh_public_key_path"></a> [ec2\_ssh\_public\_key\_path](#input\_ec2\_ssh\_public\_key\_path) | The local path to the SSH Public Key | `string` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | The ID of the Public Subnet | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_arn"></a> [ec2\_arn](#output\_ec2\_arn) | The ARN of the EC2 |
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | The ID of the EC2 |
<!-- END_TF_DOCS -->
