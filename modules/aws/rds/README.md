<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| db\_engine | The local path to the SSH Public Key | `string` | `"postgres"` |
| db\_instance\_type | Instance type for database | `string` | `"db.t2.micro"` |
| db\_password | Region for AWS resources | `string` | `"for-the-love-of-god-change-me"` |
| db\_security\_group\_name | Instance type for database | `string` | `"seucrity-db"` |
| db\_user | Region for AWS resources | `string` | `"default-user"` |
| engine\_version | The SSH Key Name | `string` | `"12.6"` |
| license | Region for AWS resources | `string` | `"postgresql-license"` |
| name | Region for AWS resources | `string` | `"databasetf"` |
| subnet\_group\_name | Instance type for database | `string` | `"subnet-db"` |

### Outputs

| Name | Description |
|------|-------------|
| public\_ip | List of public IP addresses assigned to the instances, if applicable |
<!-- END_TF_DOCS -->
