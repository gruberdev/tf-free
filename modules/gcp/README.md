<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| gcp\_firewall | ./firewall |  |
| gcp\_instance | ./compute |  |
| gcp\_storage | ./storage |  |
| gcp\_vpc | ./vpc |  |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| bucket\_name | Your instance's network on GCP. | `string` | `"my-bucket"` |
| firestore\_name | Your instance's network on GCP. | `string` | `"firestore-db-1"` |
| gcp\_project\_id | n/a | `string` | n/a |
| google\_project | n/a | `string` | `""` |
| instance\_ipv4\_name | n/a | `string` | `"ipv4-instance-gcp"` |
| instance\_name | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"example-machine"` |
| network\_name | n/a | `string` | `"gcp-network"` |
| permissions | Your instance's network on GCP. | `string` | `"publicread"` |
| project\_region | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"us-west1"` |

### Outputs

| Name | Description |
|------|-------------|
| machine\_ip | n/a |
<!-- END_TF_DOCS -->