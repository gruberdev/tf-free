<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| enable\_web | Specificies if the static IPv4 Address should be created using a binary numeric value. | `number` | `1` |
| static\_ip\_name | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"ipv4-main-ip"` |
| subnetworks | An option to enable or disable the creation of subnetworks attached to the VPC automatically. | `bool` | `true` |
| vpc\_name | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-internal-network"` |

### Outputs

| Name | Description |
|------|-------------|
| ipv4\_addr | n/a |
| network\_name | n/a |
<!-- END_TF_DOCS -->
