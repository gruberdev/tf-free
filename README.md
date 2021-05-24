# tf-free

<a href='https://drone.gruber.dev.br/gruberdev/tf-free' target='_blank'>![drone-img]</a>
<a href='https://drone.gruber.dev.br/gruberdev/tf-free' target='_blank'>![docs-img]</a>

## Motivation

A repository allowing you to create a simple and straightforward way to learn the basics of HCL's and Terraform's basics
setup, how to manage modules, deal with variable validation and provide multi-cloud resources while simultaneonsly
costing nothing, given the limits of each free tier in their respective cloud providers is withing the specified limits.

The objective oft his repository is to allow for more practical setup and minimal configuration, but being able to
scale to full-out Terraform projects without much of any structural change if any major update arrive in he menanhile.

## Main-Objective and Motivation

> **Learning a tool like Teraform can be overwhelming without access to easier practical-examples, at least
> its basics functioning, but asw although unrealistic for Production environments, it still should provide useful to teach you all the minor details that do make a difference when provisioning your infrastructure on any major cloud.**

## Getting started

```sh
curl -s free.terraform.gruber.dev.br/setup.sh | bash
```

### Root Module Documentation

<details>
  <summary>
   Click to expand
  </summary>

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

### Running tests

- Tests are available in `test` directory

- In the test directory, run the below command

```sh
go test
```

</details>

## List of free resources by cloud provider

<br>

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

- [Free resources homepage](https://cloud.google.com/free/docs/gcp-free-tier)

---

## Privisoned Resources

### Compute Engine

test

### Firewall

test

### VPC

test

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

- [Free resources homepage](https://aws.amazon.com/free/?all-free-tier)
- [Free resources homepage](https://aws.amazon.com/free/?all-free-tier)

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

- [Free resources homepage](https://azure.microsoft.com/en-us/free/free-account-faq/)

## Privisoned Resources

### Azure VMs

test

### Firewall

test

### VPC

test

</details>

## Contribution

N/A

## License

Licensed under the MIT License.

<!-- BADGE IMAGES URLs -->

[drone-img]: https://img.shields.io/drone/build/gruberdev/tf-free?label=Pipeline%20Status&color=46bac0&labelColor=1F1F1F&logo=Drone&style=flat-square&server=https%3A%2F%2Fdrone.gruber.dev.br
[docs-img]: https://img.shields.io/badge/project%20documentation-online?style=flat-square&logo=zeit&color=black

<!-- PROJECT BADGE HYPERLINKS -->

[pipeline-url]: https://drone.gruber.dev.br/gruberdev/infrastructure-fivem
[quality-url]: https://www.codefactor.io/repository/github/gruberdev/infrastructure-fivem
[documentation-url]: https://documentation.roleplay.gruber.dev.br
