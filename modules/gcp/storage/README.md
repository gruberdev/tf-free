<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| enable\_destroy | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | `bool` | `true` |
| fire\_size | Your Firestore Database size in GB's. | `number` | `5` |
| firestore\_name | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"my-firestore"` |
| name | Public name of your storage bucket on GCP. [Naming guidelines for Storage Buckets \| GCP Docs](https://cloud.google.com/storage/docs/naming-buckets) | `string` | `"regionaltftest"` |
| network\_name | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | n/a |
| permissions | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"publicread"` |
| project\_id | Google Cloud SDK project's ID number identifier. [Indetifying projects \| GCP Docs](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects) | `string` | n/a |
| region | Identifier for default resource location based on GCP region naming convention. [Regions and Zones \| GCP Docs](https://cloud.google.com/compute/docs/regions-zones) | `string` | `"us-west1"` |
| storage\_class | [Storage Bucket Classes \| GCP Docs](https://cloud.google.com/storage/docs/storage-classes) \| [GCP Storage Classes on Terraform Provider](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/storage_bucket#storage_class) | `string` | `"STANDARD"` |
| table\_name | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"share1"` |

### Outputs

| Name | Description |
|------|-------------|
| bucket\_name | Name of the GCS bucket that will receive the objects. |
<!-- END_TF_DOCS -->
