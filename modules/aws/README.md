<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./ec2 |  |
| <a name="module_internet_gateway"></a> [internet\_gateway](#module\_internet\_gateway) | ./gateway |  |
| <a name="module_public_subnet"></a> [public\_subnet](#module\_public\_subnet) | ./subnet |  |
| <a name="module_rds"></a> [rds](#module\_rds) | ./rds |  |
| <a name="module_route_table"></a> [route\_table](#module\_route\_table) | ./firewall |  |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Region for AWS resources | `string` | n/a | yes |
| <a name="input_account_key"></a> [account\_key](#input\_account\_key) | Region for AWS resources | `string` | n/a | yes |
| <a name="input_ec2_ssh_name"></a> [ec2\_ssh\_name](#input\_ec2\_ssh\_name) | The SSH Key Name | `string` | `"free-tier-ec2-key"` | no |
| <a name="input_ec2_ssh_public"></a> [ec2\_ssh\_public](#input\_ec2\_ssh\_public) | The local path to the SSH Public Key | `string` | `"aws.pub"` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | AWS Profile | `string` | `"terraform"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region for AWS resources | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_ipv6_addresses"></a> [ec2\_ipv6\_addresses](#output\_ec2\_ipv6\_addresses) | List of assigned IPv6 addresses of instances |
| <a name="output_ec2_key_name"></a> [ec2\_key\_name](#output\_ec2\_key\_name) | List of key names of instances |
| <a name="output_ec2_password_data"></a> [ec2\_password\_data](#output\_ec2\_password\_data) | List of Base-64 encoded encrypted password data for the instance |
| <a name="output_ec2_private_ip"></a> [ec2\_private\_ip](#output\_ec2\_private\_ip) | List of private IP addresses assigned to the instances |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | List of public IP addresses assigned to the instances, if applicable |
| <a name="output_rds_ip_address"></a> [rds\_ip\_address](#output\_rds\_ip\_address) | Public IP for your RDS Instance |
<!-- END_TF_DOCS -->
