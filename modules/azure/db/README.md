<!-- BEGIN_TF_DOCS -->

### Modules

| Name     | Source                 | Version |
| -------- | ---------------------- | ------- |
| database | Azure/database/azurerm |         |

### Inputs

| Name         | Description | Type     | Default             |
| ------------ | ----------- | -------- | ------------------- |
| db_name      | n/a         | `string` | `"mydatabase"`      |
| environment  | n/a         | `string` | `"dev"`             |
| location     | n/a         | `string` | `"westus"`          |
| name         | n/a         | `string` | `"myapp"`           |
| sql_password | n/a         | `string` | `"P@ssw0rd12345!"`  |
| sql_user     | n/a         | `string` | `"mradministrator"` |

### Outputs

| Name           | Description |
| -------------- | ----------- |
| connection_url | n/a         |
| sql_name       | n/a         |

<!-- END_TF_DOCS -->
