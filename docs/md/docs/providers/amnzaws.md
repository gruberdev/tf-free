# Amazon AWS

## Resources

- **1x** [Virtual Private Cloud (VPC)](aws-vpc-info)
  - **1x** [Sub-network](aws-sub-info) attached to the VPC
  - **1x** [Internet Gateway (IGW)](aws-igw-info) to provide access to the VPC
- **1x** [Route Table](aws-route-info) integrating all `VPC`, `Subnet` and the `Internet Gateway (IGW)`
- **1x** [EC2 Instance](aws-ec2-info) attached to the `Subnet`
- **1x** [Relational Database (RDS)](aws-rds-info) of your choice (e.g. MySQL, PostgreSQL)
- **1x** [S3 Storage Bucket](aws-s3-info) inside `Subnet`, configured to store the Terraform's backend state
- **1x** [DynamoDB Database](aws-dynamodb-info), mainly used for preventing that running multiple instances of this Terraform chart corrupt each other.

#### Terms & Conditions for resource usage

- Some resources are **only valid for 12 months** and not forever. Please [check the list of resources](aws-sorted-list) to verify each resource maximum usage within the Free-Tier plan.
- EC2 Machines and RDS Databases are limited to `t3.micro` and `db.t2.micro` types respectively.
- AWS provides the free-tier resource usage for all their [global regions](aws-regions) except China (Beijing).
#### Requirements

- **An active account on AWS** | See: \_[Getting started on AWS](aws-account-create)
- **[Valid Access keys to AWS Account](aws-keys-info)** | See: _[Generating your access keys](aws-keys-create)_

## Options

### Examples

### References

- [AWS Free-Tier FAQ](aws-faq)
- [AWS Free-Tier Homepage](free-aws)
- [How to set alarms for your Free-Tier account](aws-alarms-free)
- [Terraform AWS Official Provider Documentation](aws-tf-provider)
- [How to prevent charges on your Free-Tier account](aws-prevent-charges)
- [Extended terms and conditions](aws-terms)

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
