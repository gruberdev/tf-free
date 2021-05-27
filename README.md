# tf-free

<a href='https://drone.gruber.dev.br/gruberdev/tf-free' target='_blank'>![drone-img]</a>
<a href='https://free.terraform.gruber.dev.br' target='_blank'>![docs-img]</a>

## Objective

> **Creating and managing all available resources offered by major cloud providers in free-tier plans. Terraform is as the main tool used for creating, managing and providing access to these resources in a simplified and centralized manner.**

## Motivation

Every major cloud provider offers a free tier that allows for the creation of all kind of resources for every user, albeit both guides and documentation to crate and manage these resources is limited, these services have been used for the community for many useful purposes, from learning how to use each provider from hosting your own small web-server.

The objective of this repository is to allow the automation on creation and management of these resources using Terraform as the central tool. It also aims to provide resources for learning and improv
ing your skills as a Terraform user. There's also a CLI tool provided for those who want a simplified approach.

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

---

</details>

<details>
  <summary>
  Terraform module documentation
  </summary>

---

<!-- BEGIN_TF_DOCS -->

### Modules

| Name         | Source                                   | Version |
| ------------ | ---------------------------------------- | ------- |
| google_cloud | github.com/gruberdev/tf-free/modules/gcp |         |

### Inputs

| Name               | Description                                                                                                                                                                  | Type     | Default         |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------- |
| gcp_instance_name  | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"gcp-machine"` |
| gcp_project_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west1"`    |
| google_project     | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `""`            |

### Outputs

| Name          | Description |
| ------------- | ----------- |
| gcp_public_ip | n/a         |

<!-- END_TF_DOCS -->

</details>

## List of free resources per cloud provider

<details>

  <summary>
   Google Cloud (GCP)
  </summary>

### Requirements

1.

### Conditions

- Example 1
- Example 2

### More information

- [Free resources homepage](h)

---

</details>

<details>

  <summary>
   Amazon AWS
  </summary>

### Requirements

1.

### Conditions

- Example 1
- Example 2

### More information

- [Free resources homepage]()
- [Free resources homepage]()

---

</details>
<details>

  <summary>
   Microsoft Azure
  </summary>

### Requirements

1.

### Conditions

- Example 1
- Example 2

### More information

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
