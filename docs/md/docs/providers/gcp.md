# Google Cloud Platform

## Resources

- **1x** Virtual Private Cloud [VPC][gcp-vpc-info]
  - **1x** [Firewall][gcp-firewall-info] attached to the VPC
  - **1x** [Google Compute Engine][gcp-compute-info] `f1-micro` ([1 shared vCPU - 0.2 dedicatd vCPU][gcp-shared-vcpus] - and 0.6GB of Memory) attached to the `VPC`
- **1x** 5GB of [regional storage][gcp-regional-storage] on [Cloud Storage][gcp-cloud-storage]
- **1x** 1GB of storage in a [Firestore NoSQL Database][gcp-firestore-storage]

#### Terms & Conditions for resource usage

- [Compute Engine Instances ( `f1-micro` ) do not have an external **static** IP address on the free tier][no-free-ip]
- You're (as a Free-Tier only) limited to 3 US-based exclusive [zones/regions][gcp-regions] for provisioning your instance. (`us-east1`, `us-west1`, and `us-central1`)
- Cloud Storage follows similar rules to the Compute Engine terms, but is also limited to 5,000 Class A operations per month and 50,000 Class B operations per monnth maximum.

_Reference:_ [Table of Free-Tier limits][free-tier-limits]

- You're limited to 1GB of Egress (outgoing) traffic from North America to the rest of the world.

Related: [Pricing on egress rates.][pricing-egress] and [How Google calculates egress usage rates.][usage-egress-gcp]

## Requirements

### APIs used

- [Cloud Resource Manager API][resource-api-info] | [Enable it][resource-api-enable]
- [Identity and Access Management (IAM) API][iam-api-info] | [Enable it][iam-api-enable]
- [Cloud Deployment Manager V2 API][cloud-api-info] | [Enable it][cloud-api-enable]
- [Compute Engine API][compute-api-info] | [Enable it][compute-api-enable]
- [Cloud Firestore API][firestore-api-info] | [Enable it][firestore-enable-api]

## Options

### Examples

### References

- [Main landing page on the Free-Tier plan][google-free-landing]
- [Limits of the free-tier usage, from the official documentation][free-tier-limits]
- [GCP's Free Programs Overview][google-free-docs]
- [Eligibility for the Free Tier][free-tier-restrictions]
- [Detailed price-list on paid products][gcp-price-list]

<!-- Repository links -->

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
[pricing-egress]: https://cloud.google.com/vpc/network-pricing#internet_egress
[usage-egress-gcp]: https://cloud.google.com/vpc/network-pricing#vpc-pricing
[gcp-compute-info]: https://cloud.google.com/compute/docs
[gcp-shared-vcpus]: https://cloud.google.com/compute/vm-instance-pricing#cpu-bursting
[gcp-cloud-storage]: https://cloud.google.com/storage
[gcp-vpc-info]: https://cloud.google.com/storage
[gcp-firewall-info]: https://cloud.google.com/storage
[gcp-firestore-storage]: https://cloud.google.com/firestore/docs
[pricing-gcp-calculator]: https://cloud.google.com/products/calculator
[no-free-ip]: https://cloud.google.com/free/docs/gcp-free-tier#always-free-usage-limits
[pricing-egress]: https://cloud.google.com/vpc/network-pricing#internet_egress
[usage-egress-gcp]: https://cloud.google.com/vpc/network-pricing#vpc-pricing
[gcp-compute-info]: https://cloud.google.com/compute/docs
[gcp-shared-vcpus]: https://cloud.google.com/compute/vm-instance-pricing#cpu-bursting
[gcp-cloud-storage]: https://cloud.google.com/storage
[gcp-regional-storage]: https://cloud.google.com/storage/docs/storage-classes#legacy
[gcp-firestore-storage]: https://cloud.google.com/firestore/docs
[gcp-regions]: https://cloud.google.com/compute/docs/regions-zones
[firestore-api-info]: https://cloud.google.com/firestore/docs/reference/rest
[firestore-enable-api]: https://console.cloud.google.com/apis/library/file.googleapis.com
[resource-api-info]: https://cloud.google.com/resource-manager
[resource-api-enable]: https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com
[iam-api-info]: https://cloud.google.com/iam
[iam-api-enable]: https://console.cloud.google.com/apis/library/iam.googleapis.com
[compute-api-info]: https://cloud.google.com/compute
[compute-api-enable]: https://console.cloud.google.com/apis/library/compute.googleapis.com
[cloud-api-info]: https://cloud.google.com/deployment-manager
[cloud-api-enable]: https://console.cloud.google.com/apis/library/deploymentmanager.googleapis.com
