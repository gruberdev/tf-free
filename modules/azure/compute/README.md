<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| linuxservers | Azure/compute/azurerm |  |
| windowsservers | Azure/compute/azurerm |  |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| linux\_dns\_server | n/a | `string` | `"linsimplevmips"` |
| linux\_hostname | n/a | `string` | `"mywinvm"` |
| linux\_password | n/a | `string` | `"mywinvj33j4k3"` |
| resource\_group\_name | n/a | `string` | n/a |
| subnet\_id | n/a | `string` | `"dev"` |
| windows\_dns\_server | n/a | `string` | `"winsimplevmips"` |
| windows\_hostname | n/a | `string` | `"mywinvm"` |
| windows\_password | n/a | `string` | `"ComplxP@ssw0rd!"` |

### Outputs

| Name | Description |
|------|-------------|
| linux\_vm\_public\_name | n/a |
| windows\_vm\_public\_name | n/a |
<!-- END_TF_DOCS -->
