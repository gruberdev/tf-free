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
| [google_compute_firewall.allow_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_web](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_ssh_name"></a> [firewall\_ssh\_name](#input\_firewall\_ssh\_name) | A name for your firewall rule that allows access to the port 22, used for SSH connections. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"allow-ssh"` | no |
| <a name="input_firewall_web_name"></a> [firewall\_web\_name](#input\_firewall\_web\_name) | A name for your firewall rule that allows acces to both ports 80 and 443, used for common web applications. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"allow-web"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-internal-network"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
