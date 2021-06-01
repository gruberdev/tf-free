<!-- BEGIN_TF_DOCS -->
# Modules

No modules.

# Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| ami | The Amazon Machine Image | `string` | `"ami-04b9e92b5572fa0d1"` |
| instance\_type | The EC2 Instance type | `string` | `"t2.micro"` |
| name | The Name of the EC2 | `string` | `"Free Tier EC2"` |
| public\_subnet\_id | The ID of the Public Subnet | `string` | n/a |
| security\_group\_description | The Description of the EC2 Security Group | `string` | `"Free Tier EC2 Security Group"` |
| security\_group\_name | The Name of the EC2 Security Group | `string` | `"Free Tier EC2 Security Group"` |
| seed\_data | The local path to the SSH Public Key | `string` | `""` |
| should\_be\_created | Should the EC2 be created? | `bool` | `true` |
| ssh\_name | The SSH Key Name | `string` | `"free-tier-ec2-key"` |
| ssh\_public | The local path to the SSH Public Key | `string` | n/a |
| vpc\_id | The ID of the VPC | `string` | n/a |

# Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the EC2 |
| id | The ID of the EC2 |
| ipv6\_addresses | List of assigned IPv6 addresses of instances |
| names | List of key names of instances |
| password\_data | List of Base-64 encoded encrypted password data for the instance |
| private\_ip | List of private IP addresses assigned to the instances |
| public\_dns | List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC |
| public\_ip | List of public IP addresses assigned to the instances, if applicable |
| security\_group\_id | List of key names of instances |
<!-- END_TF_DOCS -->
