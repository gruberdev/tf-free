<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| gcp\_machine | ./modules/gcp |  |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| gcp\_instance\_name | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-machine"` |
| gcp\_project\_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west1"` |
| google\_project | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `""` |

### Outputs

| Name | Description |
|------|-------------|
| gcp\_public\_ip | n/a |
<!-- END_TF_DOCS -->