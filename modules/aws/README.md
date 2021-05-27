<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name                                                                                | Source     | Version |
| ----------------------------------------------------------------------------------- | ---------- | ------- |
| <a name="module_ec2"></a> [ec2](#module_ec2)                                        | ./ec2      |         |
| <a name="module_internet_gateway"></a> [internet_gateway](#module_internet_gateway) | ./gateway  |         |
| <a name="module_public_subnet"></a> [public_subnet](#module_public_subnet)          | ./subnet   |         |
| <a name="module_route_table"></a> [route_table](#module_route_table)                | ./firewall |         |
| <a name="module_vpc"></a> [vpc](#module_vpc)                                        | ./vpc      |         |

## Resources

No resources.

## Inputs

| Name                                                                                                   | Description                          | Type     | Default               | Required |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------ | -------- | --------------------- | :------: |
| <a name="input_account_id"></a> [account_id](#input_account_id)                                        | Region for AWS resources             | `string` | n/a                   |   yes    |
| <a name="input_account_key"></a> [account_key](#input_account_key)                                     | Region for AWS resources             | `string` | n/a                   |   yes    |
| <a name="input_ec2_ssh_key_name"></a> [ec2_ssh_key_name](#input_ec2_ssh_key_name)                      | The SSH Key Name                     | `string` | `"free-tier-ec2-key"` |    no    |
| <a name="input_ec2_ssh_public_key_path"></a> [ec2_ssh_public_key_path](#input_ec2_ssh_public_key_path) | The local path to the SSH Public Key | `string` | `"aws.pub"`           |    no    |
| <a name="input_profile"></a> [profile](#input_profile)                                                 | AWS Profile                          | `string` | `"terraform"`         |    no    |
| <a name="input_region"></a> [region](#input_region)                                                    | Region for AWS resources             | `string` | `"us-east-1"`         |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
