<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| enable\_destroy | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `bool` | `true` |
| name | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"REGIONAL"` |
| permissions | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"publicread"` |
| project\_id | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"-bucket"` |
| storage\_class | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"REGIONAL"` |

### Outputs

| Name | Description |
|------|-------------|
| bucket\_name | Name of the GCS bucket that will receive the objects. |
<!-- END_TF_DOCS -->
