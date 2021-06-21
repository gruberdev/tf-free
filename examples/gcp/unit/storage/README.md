<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| gcp\_storage | ../../../../modules/gcp/storage |  |
| gcp\_vpc | ../../../../modules/gcp/vpc |  |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| gcp\_bucket\_name | n/a | `string` | n/a |
| gcp\_bucket\_permissions | n/a | `string` | `"publicread"` |
| gcp\_network\_name | n/a | `string` | n/a |
| gcp\_project\_id | n/a | `string` | n/a |
| gcp\_project\_region | n/a | `string` | n/a |

### Outputs

| Name | Description |
|------|-------------|
| bucket\_name | Name of the GCS bucket that will receive the objects. |
<!-- END_TF_DOCS -->
