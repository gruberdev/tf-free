# tf-free

<a href='https://drone.gruber.dev.br/gruberdev/tf-free' target='_blank'>![drone-img]</a>
<a href='https://free.terraform.gruber.dev.br' target='_blank'>![docs-img]</a>

## Objective

> **Creating and managing all available resources offered by major cloud providers in free-tier plans. Terraform is as the main tool used for creating, managing and providing access to these resources in a simplified and centralized manner.**

## Motivation

Every major cloud provider offers a free tier that allows for the creation of all kind of resources free of charge, still, learning every cloud and managing these resources could prove burdensome.

The goal of this repository is to automate the management of these resources using Terraform as the central tool. It also aims to provide resources for learning and improve your skills as a DevOps Engineer and as a Terraform user. A CLI tool is part of this project for those who want a KIS approach.

## Getting started

```sh
curl -s https://free.terraform.gruber.dev.br/setup.sh | bash
```

<details>
  <summary>
  CLI Tool Documentation
  </summary>

### Running tests

- Tests are available in `test` directory

- In the test directory, run the below command

```sh
go test
```

### Main Libraries used

- [fatih/color](go-color-url)
- [goreleaser/goreleaser](go-releaser-url)
- [spf13/cobra](go-cobra-url)
- [kdabir/has](shell-has-url)
- [c-bata/go-prompt](go-prompt-url)
- [go-task/task](go-task-url)
- [hashicorp/terraform-exec](go-tfexec-url)
- [CONNECT-platform/codedoc](docs-repo-url)
- [cloudposse/terraform-aws-tfstate-backend](remote-tfstate-url)

---

</details>

<details>
  <summary>
  Terraform module documentation
  </summary>

---

<!-- BEGIN_TF_DOCS -->

### Modules

| Name         | Source        | Version |
| ------------ | ------------- | ------- |
| aws          | ./modules/aws |         |
| google_cloud | ./modules/gcp |         |

### Inputs

| Name               | Description                                                                                                                                                                  | Type     | Default         |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------- |
| aws_account_id     | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | n/a             |
| aws_account_key    | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | n/a             |
| aws_default_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west-2"`   |
| gcp_instance_name  | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-machine"` |
| gcp_project_id     | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `""`            |
| gcp_project_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west1"`    |

### Outputs

| Name                   | Description                                                          |
| ---------------------- | -------------------------------------------------------------------- |
| aws_ec2_ipv6_addresses | List of assigned IPv6 addresses of instances                         |
| aws_ec2_password_data  | List of Base-64 encoded encrypted password data for the instance     |
| aws_ec2_private_ip     | List of private IP addresses assigned to the instances               |
| aws_ec2_public_ip      | List of public IP addresses assigned to the instances, if applicable |
| gcp_public_ip          | n/a                                                                  |

<!-- END_TF_DOCS -->

</details>

## List of free resources per cloud provider

<details>

  <summary>
   Google Cloud (GCP)
  </summary>

---

### Available Resources

- 1x Compute Instance

### Requirements

-

### Terms & Conditions

-

### More information

- [Home]()

---

</details>

<details>

  <summary>
   Amazon AWS
  </summary>

---

### Available Resources

- 1x [Virtual Private Cloud (VPC)](aws-vpc-info)
  - 1x [Sub-network](aws-sub-info) attached to the VPC
  - 1x [Internet Gateway (IGW)](aws-igw-info) to provide access to the VPC
- 1x [Route Table](aws-route-info) integrating all `VPC`, `Subnet` and the `Internet Gateway (IGW)`
- 1x [EC2 Instance](aws-ec2-info) attached to the `Subnet`
- 1x [Relational Database (RDS)](aws-rds-info) of your choice (e.g. MySQL, PostgreSQL)
- 1x [S3 Storage Bucket](aws-s3-info) inside `Subnet`, configured to store the Terraform's backend state
- 1x [DynamoDB Database](aws-dynamodb-info), mainly used for preventing that running multiple instances of this Terraform chart corrupt each other.

---

</details>
<details>

  <summary>
   Microsoft Azure
  </summary>

---

### Available Resources

1

- [Free resources homepage]()

---

</details>

## License

The MIT license grant is not for Hashicorp's trademarks, which include the logo designs. [Hashicorp reserves all trademark and copyright rights in and to all Hashicorp trademarks](disclaimer).

Terraform®, Vault®, Hashicorp's logos are Hasicorp's Trademarks or registered Trademarks. When using Hashicorp's logos, be sure to follow the [community](guidelines) and [brand usage](brand) guidelines.

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
