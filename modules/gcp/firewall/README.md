<!-- BEGIN_TF_DOCS -->
### Modules

No modules.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| firewall\_ssh\_name | A name for your firewall rule that allows access to the port 22, used for SSH connections. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"allow-ssh"` |
| firewall\_web\_name | A name for your firewall rule that allows acces to both ports 80 and 443, used for common web applications. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"allow-web"` |
| network\_name | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-internal-network"` |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
