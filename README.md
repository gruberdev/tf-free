[![Logo Animation](https://readme-typing-svg.herokuapp.com?font=Major+Mono+Display&color=00E7F7&size=40&vCenter=true&width=800&height=200&lines=tf-free;cloud+for+free.)](https://free.terraform.gruber.dev.br)

<a href='https://free.terraform.gruber.dev.br' target='_blank'>![docs-img]</a> <a href='https://drone.gruber.dev.br' target='_blank'>![drone-img]</a>

## Objective

> **Creating and managing all available resources offered by major cloud providers exclusively in free-tier plans. Using Terraform to create and manage all the resources in a simplified and centralized manner.**

## Motivation

Every major cloud provider offers a free tier that allows for some kind of resource free of charge, still, learning every cloud and managing these resources can prove burdensome to most.

The goal is to automate the management of these resources using Terraform as the centralizing tool. It also aims to provide resources for learning and improve your skills as a SRE/DevOps Engineer and as a Terraform user, even if you're developer that never touched cloud infrastructure, nowadays there's great value in learning these tools.

## List of free-tier resources

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

  <summary> Amazon Web Services

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
   Microsoft Azure <sub> <sup>(has limited testing)</sup></sub>
  </summary>

---

### Available Resources

- **1x** [Linux Virtual machine, B1S Standard tier][azure-vm-info]
- **1x** [Windows Virtual machine, B1S Standard tier][azure-vm-info]
- **1x** [Cloud Storage (LRS File Storage)][azure-storage-info]
- **1x** [250GB MySQL Managed Database Instance][azure-sql-free-info]

More information at the [provider's documentation page][tf-free-azure-resources].

---

## </details>

</details>
<details>

  <summary>
    Oracle Cloud  <sub> <sup>(not available)</sup></sub>
  </summary>

---

### Available Resources

- **2x** [AMD based VM, 1/8 shared CPU and 1GB RAM][oracle-compute-info]
- **2x** [Oracle NoSQL Database with 20GB][oracle-database-info]
- **1x** [10GB Object Storage Capacity][oracle-storage-info]

More information at the [provider's documentation page][tf-free-oracle-resources].

---

</details>

---

##  [❯ Getting started][getting-started]

```
terraform init
terraform apply -auto-approve
```

<details>
  <summary>
   Module documentation
  </summary>

---

<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| aws | ./modules/aws | n/a |
| google\_cloud | ./modules/gcp | n/a |
| terraform\_state\_backend | cloudposse/tfstate-backend/aws | 0.38.1 |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| aws\_default\_region | Your default region for AWS resources creation. [Available regions for Google Compute on Free Tier.](https://free.terraform.gruber.dev.br/docs/resources/providers/aws#options) | `string` | `"us-east-1"` |
| backend\_destroy | Allows destroying all resourcesinside the configured S3 Remote Backend. See more at [tf-free's Backend Documentation](https://free.terraform.gruber.dev.br/docs/setup/backend) | `string` | `"false"` |
| backend\_stage | Stages possible for Backend. Set for a random string. | `string` | `"test"` |
| ec2\_aws | Allow for the creation of EC2 instances on AWS. | `bool` | `true` |
| gcp\_instance\_name | Your VM instance name. [Naming resources convention](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-machine"` |
| gcp\_project\_id | Your static IP network nameP. [Naming resources convention](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"test"` |
| gcp\_project\_region | Zone location of your instance, [see the list of available regions](https://cloud.google.com/compute/docs/regions-zones#available) - [Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#zone) | `string` | `"us-west1"` |
| gcp\_storage\_permissions | See all available values for the parameter at [Predefined ACL's on GCS Permissions](https://cloud.google.com/storage/docs/access-control/lists#predefined-acl) | `string` | `"publicread"` |
| prevents\_destroy | Prevents destroying the previously provisioned S3 Remote Backend. See more at [tf-free's Backend Documentation](https://free.terraform.gruber.dev.br/docs/setup/backend) | `bool` | `true` |
| rds\_aws | Allow for the creation of a PostgreSQL database on AWS | `bool` | `true` |

### Outputs

| Name | Description |
|------|-------------|
| aws\_ec2\_ipv6\_addresses | AWS EC2 IPv6 Public Address |
| aws\_ec2\_password\_data | List of Base-64 encoded encrypted password data for AWS EC2 instances |
| aws\_ec2\_private\_ip | AWS EC2 assigned Private IP |
| aws\_ec2\_public\_ip | AWS EC2 IPv4 Public Address |
| db\_backend\_name | Name of the resulting DynamoDB created for locking state files. |
| gcp\_public\_ip | GCP VM Compute IPv4 Public Address |
| s3\_backend\_bucket | ID of the resulting S3 bucket created on AWS as part of the backend infrastructure |
| s3\_backend\_domain | Domain name of the S3 bucket created on AWS as part of the backend infrastructure |
<!-- END_TF_DOCS -->

</details>

---

## License

The MIT license grant is not for Hashicorp's trademarks, which include the logo designs. [Hashicorp reserves all trademark and copyright rights in and to all Hashicorp trademarks][disclaimer].

This repository **is not** associated with any of the cloud providers or Hashicorp. Terraform®, Vault®, Hashicorp's logos and names are Hasicorp's registered Trademarks. When using Hashicorp's logos, be sure to follow their [community][guidelines] and [brand usage][brand] guidelines.
Be sure to [read the terms][usage-terms] of usage to understand the responsabilities involved.

<!-- Images URLs -->

[drone-img]: https://img.shields.io/drone/build/gruberdev/tf-free/main?label=drone%20pipeline&logo=drone&labelColor=1F1F1F&logoColor=41dde8&style=flat-square
[docs-img]: https://img.shields.io/badge/read%20available%20documentation-online?style=flat-square&logo=zeit&color=black

<!-- Repository links -->

[brand]: https://www.hashicorp.com/brand
[disclaimer]: https://www.hashicorp.com/trademark-policy
[guidelines]: https://www.hashicorp.com/community-guidelines
[free-aws]: https://aws.amazon.com/free/?all-free-tier
[free-gcp]: https://cloud.google.com/free
[kis-approach]: https://en.wikipedia.org/wiki/KISS_principle
[free-docs-gcp]: https://cloud.google.com/free/docs/gcp-free-tier
[free-azure]: https://azure.microsoft.com/en-us/free/
[azure-faq]: https://azure.microsoft.com/en-us/free/free-account-faq/
[usage-terms]: https://free.terraform.gruber.dev.br/docs/resources/providers/gcp#resources
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
[oracle-compute-info]: https://www.oracle.com/cloud/compute/
[oracle-database-info]: https://www.oracle.com/database/
[oracle-storage-info]: https://www.oracle.com/cloud/storage/
[tf-free-oracle-resources]: https://free.terraform.gruber.dev.br/docs/resources/providers/oracle#resources
[tf-free-oracle-resources]: https://free.terraform.gruber.dev.br/docs/resources/providers/oracle#resources
[project-taskfile]: https://github.com/gruberdev/tf-free/blob/main/Taskfile.yml
[taskfile-website]: https://taskfile.dev
[getting-started]: https://free.terraform.gruber.dev.br/docs/setup/getting-started