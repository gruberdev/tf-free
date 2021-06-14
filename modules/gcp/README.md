<!-- BEGIN_TF_DOCS -->

### Modules

| Name         | Source     | Version |
| ------------ | ---------- | ------- |
| gcp_firewall | ./firewall |         |
| gcp_instance | ./compute  |         |
| gcp_storage  | ./storage  |         |
| gcp_vpc      | ./vpc      |         |

### Inputs

| Name               | Description                                                                                                                                                                                 | Type     | Default                |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---------------------- |
| bucket_name        | Public name of your storage bucket on GCP. [Naming guidelines for Storage Buckets \| GCP Docs](https://cloud.google.com/storage/docs/naming-buckets)                                        | `string` | `"averynoncommonbuck"` |
| firestore_name     | Your instance's network on GCP.                                                                                                                                                             | `string` | `"firestore-db-1"`     |
| gcp_project_id     | Google Cloud SDK project's ID number identifier. [Indetifying projects \| GCP Docs](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects)         | `string` | n/a                    |
| google_project     | n/a                                                                                                                                                                                         | `string` | `""`                   |
| instance_ipv4_name | n/a                                                                                                                                                                                         | `string` | `"ipv4-instance-gcp"`  |
| instance_name      | GCP Compute Instance Name. [Resource Naming Convention \| GCP Compute Docs](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)                                    | `string` | `"example-machine"`    |
| network_name       | Creates and names a VPC network. A VPC network is not the same as a GCP Subnetwork, see: [VPC Network Overview \| GCP Docs](https://cloud.google.com/vpc/docs/vpc#vpc_networks_and_subnets) | `string` | `"gcp-network2"`       |
| permissions        | Your instance's network on GCP.                                                                                                                                                             | `string` | `"publicread"`         |
| project_region     | Identifier for default resource location based on GCP region naming convention. [Regions and Zones \| GCP Docs](https://cloud.google.com/compute/docs/regions-zones)                        | `string` | `"us-west1"`           |

### Outputs

| Name       | Description |
| ---------- | ----------- |
| machine_ip | n/a         |

<!-- END_TF_DOCS -->
