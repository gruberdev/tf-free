# tf-free

A repository allowing you to create a simple and straightforward way to learn the basics of HCL's and Terraform's basics
setup, how to manage modules, deal with variable validation and provide multi-cloud resources while simultaneonsly
costing nothing, given the limits of each free tier in their respective cloud providers is withing the specified limits.

The objective oft his repository is to allow for more practical setup and minimal configuration, but being able to
scale to full-out Terraform projects without much of any structural change if any major update arrive in he menanhile.

## Main-Objective and Motivation

> **Learning a tool like Teraform can be overwhelming without access to easier practical-examples, at least
> its basics functioning, but asw although unrealistic for Production environments, it still should provide useful to teach you all the minor details that do make a difference when provisioning your infrastructure on any major cloud.**

---

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

| Name | Source                | Version |
| ---- | --------------------- | ------- |
| gcp  | ./modules/gcp/compute |         |

### Inputs

| Name               | Description                                                                                                                                                                  | Type     | Default      |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| gcp_project_id     | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `""`         |
| gcp_project_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west1"` |

### Outputs

No outputs.

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

## Privisoned Resources

### Amazon EC2

test

### Amazon RDS

test

### Amazon S3

### VPC

test

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
