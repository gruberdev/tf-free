<!-- BEGIN_TF_DOCS -->

### Modules

No modules.

### Inputs

| Name         | Description                                                                                                                                                                                                                                                                                         | Type     | Default                    |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------------------- |
| disk_size    | Allocated GB's of disk to your GCE instance                                                                                                                                                                                                                                                         | `number` | `30`                       |
| disk_type    | Storage Disk Type. [GCP Official documentation](https://cloud.google.com/compute/docs/disks#disk-types)                                                                                                                                                                                             | `string` | `"pd-standard"`            |
| image        | Image to initialize your GCE Instance, a full list of options [is available on GCP's official documentation](https://cloud.google.com/compute/docs/images)                                                                                                                                          | `string` | `"debian-cloud/debian-10"` |
| ip_addr      | The IP address that will be 1:1 mapped to the instance's network ip. If not given, one will be generated. [Docs Ref.](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#access_config)                                                                | `string` | `null`                     |
| name         | A name for the project's GCE Instance. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)                                                                                                                              | `string` | `"private"`                |
| network_name | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)                                               | `string` | `"example-network"`        |
| region       | Zone location of your instance, you can choose a region on [GCP's Official Documentation](https://cloud.google.com/compute/docs/regions-zones#available) - [Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#zone) | `string` | `"us-west1"`               |
| type         | GCP Instance Machine type. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)                                      | `string` | `"f1-micro"`               |

### Outputs

| Name           | Description |
| -------------- | ----------- |
| external_ip    | n/a         |
| instance_id    | n/a         |
| internal_ip    | n/a         |
| resulting_name | n/a         |
| resulting_type | n/a         |

<!-- END_TF_DOCS -->
