<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp_firewall"></a> [gcp\_firewall](#module\_gcp\_firewall) | github.com/gruberdev/tf-free/modules/gcp/firewall |  |
| <a name="module_gcp_instance"></a> [gcp\_instance](#module\_gcp\_instance) | github.com/gruberdev/tf-free/modules/gcp/compute |  |
| <a name="module_gcp_vpc"></a> [gcp\_vpc](#module\_gcp\_vpc) | github.com/gruberdev/tf-free/modules/gcp/vpc |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_google_project"></a> [google\_project](#input\_google\_project) | n/a | `string` | `""` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"example-machine"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | `"gcp-core-network"` | no |
| <a name="input_project_region"></a> [project\_region](#input\_project\_region) | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"us-west1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_machine_ip"></a> [machine\_ip](#output\_machine\_ip) | n/a |
<!-- END_TF_DOCS -->