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
| [aws_db_instance.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_db_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet_ids.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | The local path to the SSH Public Key | `string` | `"postgres"` | no |
| <a name="input_db_instance_type"></a> [db\_instance\_type](#input\_db\_instance\_type) | Instance type for database | `string` | `"db.t2.micro"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Region for AWS resources | `string` | `"for-the-love-of-god-change-me"` | no |
| <a name="input_db_security_group_name"></a> [db\_security\_group\_name](#input\_db\_security\_group\_name) | Instance type for database | `string` | `"seucrity-db"` | no |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Region for AWS resources | `string` | `"default-user"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The SSH Key Name | `string` | `"12.6"` | no |
| <a name="input_license"></a> [license](#input\_license) | Region for AWS resources | `string` | `"postgresql-license"` | no |
| <a name="input_name"></a> [name](#input\_name) | Region for AWS resources | `string` | `"databasetf"` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | Instance type for database | `string` | `"subnet-db"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | List of public IP addresses assigned to the instances, if applicable |
<!-- END_TF_DOCS -->
