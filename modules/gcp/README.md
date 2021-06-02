<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| gcp\_firewall | ./firewall |  |
| gcp\_instance | ./compute |  |
| gcp\_vpc | ./vpc |  |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_google_project"></a> [google\_project](#input\_google\_project) | n/a | `string` | `""` | no |
| <a name="input_instance_ipv4_name"></a> [instance\_ipv4\_name](#input\_instance\_ipv4\_name) | n/a | `string` | `"ipv4-instance-gcp"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"example-machine"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | `"gcp-core-network"` | no |
| <a name="input_project_region"></a> [project\_region](#input\_project\_region) | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"us-west1"` | no |

### Outputs

| Name | Description |
|------|-------------|
| machine\_ip | n/a |
<!-- END_TF_DOCS -->