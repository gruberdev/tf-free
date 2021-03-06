[![Logo Animation](https://readme-typing-svg.herokuapp.com?font=Major+Mono+Display&color=00E7F7&size=40&vCenter=true&width=800&height=130&lines=tf-free;cloud+for+free.)](https://free.terraform.gruber.dev.br)

---

# Introduction
> **Creating all available resources offered by major cloud providers within free-tier plans, using Terraform to provide, manage and access these resources in a simplified and centralized manner.**

### Project's objective

Every major cloud provider offers a free tier that allows for some kind of resource free of charge, still, learning every cloud and managing these resources can prove burdensome to most.

The goal is to automate the management of these resources using Terraform as the centralizing tool. It also aims to provide resources for learning and improve your skills as a SRE/DevOps Engineer and as a Terraform user, even if you're developer that never touched cloud infrastructure, nowadays there's great value in learning these tools.

A CLI tool is part of this project for those who wish a more [KIS][kis-approach]-like approach.

---

# How to use these project's resources:

There are three main ways to bootstrap this project:

1. Using the CLI tool (recommended)
2. Use Terraform's module directly (advanced)

The second method exemplified below:

```bash | --no-wmbar
terraform apply -auto-approve
```

> :Buttons
>
> > :CopyButton

To visualize the available commands:

```bash | --no-wmbar
sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
task --list # Display help message
> * gcp:                  Build executable binary with GoReleaser.
> * gcp-boot:             test
> * gcp-init:             Bootstrapping Google Cloud provider testing files
> * gcp-test:             Terraform testing (GCP provider)
> * graph:                Create beautiful Terraform Graphs
> * heavy-artillery:      Destroy all resources but the S3 Backend .and the DynamoDB instances on AWS.
```

> :Buttons
>
> > :CopyButton

---

Now, if you want to explicitly call the core module, write a `main.tf` with this content:

```hcl | /example/main.tf
// Create a main.tf file anywhere with Terraform installed and copy-paste this code

module "tf-free" {
   source = "github.com/gruberdev/tf-free"

/*!*/   enable_aws    = true  // @see [AWS documentation](/docs/providers/amznaws)
/*!*/   enable_s3_backend  = true  // @see [using a remote S3 on AWS reference](/docs/setup/backend)
   aws_account_id     = "your-aws-access-id"
   aws_account_key    = "your-aws-secret-key"
   aws_default_region = "us-west1"

/*!*/  enable_gcp   =  true // @see [GCP's documentation](/docs/providers/gcloud)
  gcp_project_id     = "testing-project-1"
  gcp_project_region = "us-west-1"
  gcp_instance_name  = "gcp-machine"

/*!*/  enable_azure   =  true // @see [Azure's documentation](/docs/providers/msazure)

/*!*/  enable_oracle   =  true // @see [Oracle's documentation](/docs/providers/msazure)
}
```

> :Buttons
>
> > :CopyButton

<br>

If you're unsure what your credentials are for each cloud provider, take a look at [Obtaining credentials](/docs/setup/first-run).

> :Buttons
>
> > :Button icon=true, label=double_arrow, url=/docs/setup/getting-started

---

<!-- Images URLs -->

[drone-img]: https://img.shields.io/drone/build/gruberdev/tf-free?label=Pipeline%20Status&color=46bac0&labelColor=1F1F1F&logo=Drone&style=for-the-badge&server=https%3A%2F%2Fdrone.gruber.dev.br
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
