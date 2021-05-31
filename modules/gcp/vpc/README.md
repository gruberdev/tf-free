<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_address.static](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_address) | resource |
| [google_compute_network.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_google_project"></a> [google\_project](#input\_google\_project) | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | n/a | yes |
| <a name="input_static_ip_name"></a> [static\_ip\_name](#input\_static\_ip\_name) | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"ipv4-main-ip"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-internal-network"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv4_addr"></a> [ipv4\_addr](#output\_ipv4\_addr) | n/a |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | n/a |
<!-- END_TF_DOCS -->
