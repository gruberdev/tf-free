<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.gcp_example](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Allocated GB's of disk to your GCE instance | `number` | `30` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | Storage Disk Type. [GCP Official documentation](https://cloud.google.com/compute/docs/disks#disk-types) | `string` | `"pd-standard"` | no |
| <a name="input_image"></a> [image](#input\_image) | Image to initialize your GCE Instance, a full list of options [is available on GCP's official documentation](https://cloud.google.com/compute/docs/images) | `string` | `"debian-cloud/debian-10"` | no |
| <a name="input_ip_addr"></a> [ip\_addr](#input\_ip\_addr) | The IP address that will be 1:1 mapped to the instance's network ip. If not given, one will be generated. [Docs Ref.](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#access_config) | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name for the project's GCE Instance. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"private"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"example-network"` | no |
| <a name="input_region"></a> [region](#input\_region) | Zone location of your instance, you can choose a region on [GCP's Official Documentation](https://cloud.google.com/compute/docs/regions-zones#available) - [Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#zone) | `string` | `"us-west1"` | no |
| <a name="input_type"></a> [type](#input\_type) | GCP Instance Machine type. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type) | `string` | `"f1-micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | n/a |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | n/a |
| <a name="output_resulting_name"></a> [resulting\_name](#output\_resulting\_name) | n/a |
| <a name="output_resulting_type"></a> [resulting\_type](#output\_resulting\_type) | n/a |
<!-- END_TF_DOCS -->
