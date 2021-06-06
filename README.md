[![Logo Animation](https://readme-typing-svg.herokuapp.com?font=Major+Mono+Display&color=00E7F7&size=40&vCenter=true&width=800&height=200&lines=tf-free;cloud+for+free.)](https://free.terraform.gruber.dev.br)

<a href='https://drone.gruber.dev.br/gruberdev/tf-free' target='_blank'>![drone-img]</a>
<a href='https://free.terraform.gruber.dev.br' target='_blank'>![docs-img]</a>

## Objective

> **Creating and managing all available resources offered by major cloud providers in free-tier plans. Terraform is as the main tool used for creating, managing and providing access to these resources in a simplified and centralized manner.**

## Motivation

Every major cloud provider offers a free tier that allows for the creation of all kind of resources free of charge, still, learning every cloud and managing these resources could prove burdensome.

The goal of this repository is to automate the management of these resources using Terraform as the central tool. It also aims to provide resources for learning and improve your skills as a DevOps Engineer and as a Terraform user. A CLI tool is part of this project for those who want a KIS approach.

## Getting started

```
# one liner docker-install for debian-based systems
curl -sSLf https://gruber.dev.br/install | bash -s terraform-free
```

Or use the explicit url/preview the script content

```
wget https://raw.githubusercontent.com/gruberdev/setup/main/install.sh && cat install.sh && rm install.sh
curl -sSL https://raw.githubusercontent.com/gruberdev/setup/main/install.sh | bash -s terraform-free
```

- [CLI Tool Documentation][tf-free-docs-cli]

<details>
  <summary>
  Terraform module documentation
  </summary>

---

<!-- BEGIN_TF_DOCS -->

### Modules

| Name                    | Source                         | Version |
| ----------------------- | ------------------------------ | ------- |
| aws                     | ./modules/aws                  |         |
| google_cloud            | ./modules/gcp                  |         |
| terraform_state_backend | cloudposse/tfstate-backend/aws | v0.32.1 |

### Inputs

| Name               | Description                                                                                                                                                                  | Type     | Default         |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------- |
| aws_account_id     | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | n/a             |
| aws_account_key    | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | n/a             |
| aws_default_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-east-1"`   |
| backend_destroy    | Allows destroying the backend.                                                                                                                                               | `string` | `"false"`       |
| backend_stage      | Stages possible for Backend.                                                                                                                                                 | `string` | `"test"`        |
| gcp_instance_name  | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-machine"` |
| gcp_project_id     | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `""`            |
| gcp_project_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west1"`    |

### Outputs

| Name                   | Description                                                                        |
| ---------------------- | ---------------------------------------------------------------------------------- |
| aws_ec2_ipv6_addresses | AWS EC2 IPv6 Public Address                                                        |
| aws_ec2_password_data  | List of Base-64 encoded encrypted password data for AWS EC2 instances              |
| aws_ec2_private_ip     | AWS EC2 assigned Private IP                                                        |
| aws_ec2_public_ip      | AWS EC2 IPv4 Public Address                                                        |
| db_backend_name        | Name of the resulting DynamoDB created for locking state files.                    |
| gcp_public_ip          | GCP VM Compute IPv4 Public Address                                                 |
| s3_backend_bucket      | ID of the resulting S3 bucket created on AWS as part of the backend infrastructure |
| s3_backend_domain      | Domain name of the S3 bucket created on AWS as part of the backend infrastructure  |

<!-- END_TF_DOCS -->

</details>

## List of free resources per cloud provider

<details>

  <summary>
   Google Cloud Platform
  </summary>

---

## GCP Available Resources

- **1x** [Virtual Private Cloud (VPC)][gcp-vpc-info]
  - **1x** [Firewall][gcp-firewall-info] attached to the VPC
  - **1x** [Google Compute Engine][gcp-compute-info] `f1-micro` [(1 shared vCPU - 0.2 dedicatd vCPU][gcp-shared-vcpus] - and 0.6GB of Memory) attached to the `VPC`
- **1x** 5GB of [regional storage][gcp-regional-storage] on [Cloud Storage][gcp-cloud-storage]
- **1x** 1GB of storage in a [Firestore NoSQL Database][gcp-firestore-storage]

More information at the [provider's documentation page][tf-free-gcp-resources].

---

</details>

<details>

  <summary>
   Amazon Web Services
  </summary>

---

### AWS Available Resources

- **2x** [Virtual Private Cloud (VPC)][aws-vpc-info]
  - **2x** [Sub-network][aws-sub-info] attached to the VPC
  - **2x** [Internet Gateway (IGW)][aws-igw-info] to provide access to the VPC
- **1x** [Route Table][aws-route-info] integrating all `VPC`, `Subnet` and the `Internet Gateway (IGW)`
- **1x** [EC2 Instance][aws-ec2-info] attached to the `Subnet`
- **1x** [Relational Database (RDS)][aws-rds-info] of your choice (e.g. MySQL, PostgreSQL)
- **1x** [S3 Storage Bucket][aws-s3-info] inside `Subnet`, configured to store the Terraform's backend state
- **1x** [DynamoDB Database][aws-dynamodb-info], mainly used for preventing that running multiple instances of this Terraform chart corrupt each other.

More information at the [provider's documentation page][tf-free-aws-resources].

---

</details>
<details>

  <summary>
   Microsoft Azure Cloud
  </summary>

---

### Available Resources

- **1x** [Linux Virtual machine, B1S Standard tier][azure-vm-info]
- **1x** [Windows Virtual machine, B1S Standard tier][azure-vm-info]
- **1x** [Cloud Storage (LRS File Storage)][azure-storage-info]
- **1x** [250GB MySQL Managed Database Instance][azure-sql-free-info]

More information at the [provider's documentation page][tf-free-azure-resources].

---

</details>

## License

The MIT license grant is not for Hashicorp's trademarks, which include the logo designs. [Hashicorp reserves all trademark and copyright rights in and to all Hashicorp trademarks][disclaimer].

Terraform®, Vault®, Hashicorp's logos are Hasicorp's Trademarks or registered Trademarks. When using Hashicorp's logos, be sure to follow the [community][guidelines] and [brand usage][brand] guidelines.

<!-- Images URLs -->

[drone-img]: https://img.shields.io/drone/build/gruberdev/tf-free?label=Pipeline%20Status&color=46bac0&labelColor=1F1F1F&logo=Drone&style=flat-square&server=https%3A%2F%2Fdrone.gruber.dev.br
[docs-img]: https://img.shields.io/badge/read%20documentation-online?style=flat-square&logo=zeit&color=black

<!-- Repository links -->

[brand]: https://www.hashicorp.com/brand
[disclaimer]: https://www.hashicorp.com/trademark-policy
[guidelines]: https://www.hashicorp.com/community-guidelines
[free-aws]: https://aws.amazon.com/free/?all-free-tier
[free-gcp]: https://cloud.google.com/free
[free-docs-gcp]: https://cloud.google.com/free/docs/gcp-free-tier
[free-azure]: https://azure.microsoft.com/en-us/free/
[azure-faq]: https://azure.microsoft.com/en-us/free/free-account-faq/
[azure-full-terms]: https://azure.microsoft.com/en-us/offers/ms-azr-0044p/
[aws-faq]: https://aws.amazon.com/free/free-tier-faqs/
[docs-repo-url]: https://github.com/CONNECT-platform/codedoc
[aws-key-info]: https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys
[aws-key-create]: https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/
[aws-account-create]: https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/
[aws-vpc-info]: https://aws.amazon.com/vpc/?vpc-blogs.sort-by=item.additionalFields.createdDate&vpc-blogs.sort-order=desc
[aws-igw-info]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html
[aws-ec2-info]: https://aws.amazon.com/ec2/
[aws-s3-info]: https://aws.amazon.com/s3/
[aws-rds-info]: https://aws.amazon.com/rds/
[aws-sub-info]: https://docs.aws.amazon.com/vpc/latest/userguide/working-with-vpcs.html
[aws-tf-provider]: https://registry.terraform.io/providers/hashicorp/aws/latest/
[aws-regions]: https://aws.amazon.com/about-aws/global-infrastructure/
[aws-terms]: https://aws.amazon.com/free/terms/
[aws-prevent-charges]: https://aws.amazon.com/premiumsupport/knowledge-center/free-tier-charges/
[aws-alarms-free]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/tracking-free-tier-usage.html#free-budget
[aws-sorted-list]: https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=tier%23always-free%7Ctier%2312monthsfree&awsf.Free%20Tier%20Categories=*all
[aws-dynamodb-info]: https://aws.amazon.com/dynamodb/
[remote-tfstate-url]: https://github.com/cloudposse/terraform-aws-tfstate-backend
[tf-free-docs-cli]: https://free.terraform.gruber.dev.br/docs/setup/installing#cli
[tf-free-gcp-resources]: https://free.terraform.gruber.dev.br/docs/resources/providers/gcp#resources
[tf-free-aws-resources]: https://free.terraform.gruber.dev.br/docs/resources/providers/aws#resources
[tf-free-azure-resources]: https://free.terraform.gruber.dev.br/docs/resources/providers/azure#resources
[guidelines]: https://www.hashicorp.com/community-guidelines
[free-gcp]: https://cloud.google.com/free
[free-docs-gcp]: https://cloud.google.com/free/docs/gcp-free-tier
[free-tier-limits]: https://cloud.google.com/free/docs/gcp-free-tier/#free-tier-usage-limits
[free-tier-restrictions]: https://cloud.google.com/free/docs/gcp-free-tier/#free-tier
[google-free-docs]: https://cloud.google.com/free/docs/gcp-free-tier/
[google-free-landing]: https://cloud.google.com/free
[unique-gcp-docs]: https://cloud.google.com/free/docs/what-makes-google-cloud-platform-different
[why-google]: https://cloud.google.com/why-google-cloud
[gcp-price-list]: https://cloud.google.com/pricing/list
[gcp-comparison-docs]: https://cloud.google.com/free/docs/aws-azure-gcp-service-comparison
[pricing-gcp-calculator]: https://cloud.google.com/products/calculator
[no-free-ip]: https://cloud.google.com/free/docs/gcp-free-tier#always-free-usage-limits
[pricing-egress]: https://cloud.google.com/vpc/network-pricing#internet_egress
[usage-egress-gcp]: https://cloud.google.com/vpc/network-pricing#vpc-pricing
[gcp-compute-info]: https://cloud.google.com/compute/docs
[gcp-shared-vcpus]: https://cloud.google.com/compute/vm-instance-pricing#cpu-bursting
[gcp-cloud-storage]: https://cloud.google.com/storage
[gcp-vpc-info]: https://cloud.google.com/storage
[gcp-firewall-info]: https://cloud.google.com/storage
[gcp-regional-storage]: https://cloud.google.com/storage/docs/storage-classes#legacy
[gcp-firestore-storage]: https://cloud.google.com/firestore/docs
[gcp-regions]: https://cloud.google.com/compute/docs/regions-zones
[brand]: https://www.hashicorp.com/brand
[disclaimer]: https://www.hashicorp.com/trademark-policy
[guidelines]: https://www.hashicorp.com/community-guidelines
[free-aws]: https://aws.amazon.com/free/?all-free-tier
[free-gcp]: https://cloud.google.com/free
[free-docs-gcp]: https://cloud.google.com/free/docs/gcp-free-tier
[free-azure]: https://azure.microsoft.com/en-us/free/
[azure-faq]: https://azure.microsoft.com/en-us/free/free-account-faq/
[azure-full-terms]: https://azure.microsoft.com/en-us/offers/ms-azr-0044p/
[aws-faq]: https://aws.amazon.com/free/free-tier-faqs/
[go-color-url]: https://github.com/fatih/color
[go-releaser-url]: https://github.com/goreleaser/goreleaser
[go-cobra-url]: https://github.com/spf13/cobra
[shell-has-url]: https://github.com/kdabir/has
[go-prompt-url]: https://github.com/c-bata/go-prompt
[go-task-url]: https://github.com/go-task/task
[go-tfexec-url]: https://github.com/hashicorp/terraform-exec
[docs-repo-url]: https://github.com/CONNECT-platform/codedoc
[aws-key-info]: https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys
[aws-key-create]: https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/
[aws-account-create]: https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/
[aws-vpc-info]: https://aws.amazon.com/vpc/?vpc-blogs.sort-by=item.additionalFields.createdDate&vpc-blogs.sort-order=desc
[aws-igw-info]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html
[aws-ec2-info]: https://aws.amazon.com/ec2/
[aws-s3-info]: https://aws.amazon.com/s3/
[aws-rds-info]: https://aws.amazon.com/rds/
[aws-route-info]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html
[aws-sub-info]: https://docs.aws.amazon.com/vpc/latest/userguide/working-with-vpcs.html
[aws-tf-provider]: https://registry.terraform.io/providers/hashicorp/aws/latest/
[aws-regions]: https://aws.amazon.com/about-aws/global-infrastructure/
[aws-terms]: https://aws.amazon.com/free/terms/
[aws-prevent-charges]: https://aws.amazon.com/premiumsupport/knowledge-center/free-tier-charges/
[aws-alarms-free]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/tracking-free-tier-usage.html#free-budget
[aws-sorted-list]: https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=tier%23always-free%7Ctier%2312monthsfree&awsf.Free%20Tier%20Categories=*all
[aws-dynamodb-info]: https://aws.amazon.com/dynamodb/
[remote-tfstate-url]: https://github.com/cloudposse/terraform-aws-tfstate-backend
[azure-sql-free-info]: https://azure.microsoft.com/en-us/products/azure-sql/database/
[azure-vm-info]: https://azure.microsoft.com/en-us/services/virtual-machines/
[azure-storage-info]: https://azure.microsoft.com/en-us/services/storage/files/
