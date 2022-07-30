<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| rds | ../../../../modules/aws/rds | n/a |
| vpc | ../../../../modules/aws/vpc | n/a |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| allocated\_storage | n/a | `number` | `5` |
| aws\_default\_region | n/a | `string` | n/a |
| database\_name | n/a | `string` | `"newtable"` |
| db\_port | n/a | `number` | `5432` |
| engine\_name | n/a | `string` | n/a |
| engine\_version | n/a | `string` | n/a |
| instance\_class | n/a | `string` | n/a |
| name | n/a | `string` | n/a |
| password | n/a | `string` | n/a |
| rds\_enable | n/a | `bool` | `true` |
| username | n/a | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| db\_id | List of key names of instances |
| db\_port | List of public IP addresses assigned to the instances, if applicable |
<!-- END_TF_DOCS -->