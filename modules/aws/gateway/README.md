<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                  | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |

## Inputs

| Name                                                                                                                                    | Description                             | Type     | Default                        | Required |
| --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | -------- | ------------------------------ | :------: |
| <a name="input_internet_gateway_name"></a> [internet_gateway_name](#input_internet_gateway_name)                                        | The Name of the Internet Gateway        | `string` | `"Free Tier Internet Gateway"` |    no    |
| <a name="input_internet_gateway_should_be_created"></a> [internet_gateway_should_be_created](#input_internet_gateway_should_be_created) | Should the Internet Gateway be created? | `bool`   | `true`                         |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                                     | The ID of the VPC                       | `string` | n/a                            |   yes    |

## Outputs

| Name                                                                                         | Description                    |
| -------------------------------------------------------------------------------------------- | ------------------------------ |
| <a name="output_internet_gateway_id"></a> [internet_gateway_id](#output_internet_gateway_id) | The ID of the Internet Gateway |

<!-- END_TF_DOCS -->
