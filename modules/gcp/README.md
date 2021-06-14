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
| bucket\_name | Public name of your storage bucket on GCP. [Naming guidelines for Storage Buckets \| GCP Docs](https://cloud.google.com/storage/docs/naming-buckets) | `string` | `"averynoncommonbuck"` |
| firestore\_name | Your instance's network on GCP. | `string` | `"firestore-db-1"` |
| gcp\_project\_id | Google Cloud SDK project's ID number identifier. [Indetifying projects \| GCP Docs](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects) | `string` | n/a |
| google\_project | n/a | `string` | `""` |
| instance\_ipv4\_name | n/a | `string` | `"ipv4-instance-gcp"` |
| instance\_name | GCP Compute Instance Name. [Resource Naming Convention \| GCP Compute Docs](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"example-machine"` |
| network\_name | Creates and names a VPC network. A VPC network is not the same as a GCP Subnetwork, see: [VPC Network Overview \| GCP Docs](https://cloud.google.com/vpc/docs/vpc#vpc_networks_and_subnets) | `string` | `"gcp-network2"` |
| permissions | Your instance's network on GCP. | `string` | `"publicread"` |
| project\_region | Identifier for default resource location based on GCP region naming convention. [Regions and Zones \| GCP Docs](https://cloud.google.com/compute/docs/regions-zones) | `string` | `"us-west1"` |

### Outputs

| Name | Description |
|------|-------------|
| machine\_ip | n/a |
<!-- END_TF_DOCS -->
