
variable "google_project" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "gcp_project_region" {
  type        = string
  default     = "us-west1"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "gcp_instance_name" {
  type        = string
  default     = "gcp-machine"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "vpc_name" {
  type        = string
  default     = "gcp-internal-network"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "static_ip_name" {
  type        = string
  default     = "ipv4-main-ip"
  description = "Your static IP network resource name on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "subnetworks" {
  type        = bool
  default     = true
  description = "An option to enable or disable the creation of subnetworks attached to the VPC automatically."
}

variable "enable_web" {
  type        = number
  default     = 1
  description = "Specificies if the static IPv4 Address should be created using a binary numeric value."
}


variable "firewall_web_name" {
  type        = string
  default     = "allow-web"
  description = "A name for your firewall rule that allows acces to both ports 80 and 443, used for common web applications. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "firewall_ssh_name" {
  type        = string
  default     = "allow-ssh"
  description = "A name for your firewall rule that allows access to the port 22, used for SSH connections. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}


variable "name" {
  type        = string
  default     = "private"
  description = "A name for the project's GCE Instance. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}

variable "type" {
  type        = string
  default     = "f1-micro"
  description = "GCP Instance Machine type. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
  validation {
    condition     = var.type == "f1-micro"
    error_message = "Error: Only f1-micro instances are elligible for the free Tier on GCP."
  }
}

variable "region" {
  type        = string
  default     = "us-west1"
  description = "Zone location of your instance, you can choose a region on [GCP's Official Documentation](https://cloud.google.com/compute/docs/regions-zones#available) - [Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#zone)"
  validation {
    condition     = can(index(["us-west1", "us-central1", "us-east1"], var.region))
    error_message = "Error: Only U.S. regions are available for the free tier GCE instances."
  }
}

variable "image" {
  type        = string
  default     = "debian-cloud/debian-10"
  description = "Image to initialize your GCE Instance, a full list of options [is available on GCP's official documentation](https://cloud.google.com/compute/docs/images)"
}

variable "disk_size" {
  type        = number
  default     = 30
  description = "Allocated GB's of disk to your GCE instance"
  validation {
    condition     = var.disk_size > 10 || var.disk_size < 30
    error_message = "Error: Minimum disk size is 10GB (for most Linux OS) and the Free tier maximum disk size is 30GB."
  }
}

variable "disk_type" {
  type        = string
  default     = "pd-standard"
  description = "Storage Disk Type. [GCP Official documentation](https://cloud.google.com/compute/docs/disks#disk-types)"
  validation {
    condition     = var.disk_type == "pd-standard"
    error_message = "Error: Only Standard Persistent Disks ('pd-standard') are elligible for the free tier on GCP."
  }
}

variable "network_name" {
  type        = string
  default     = "example-network"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "ip_addr" {
  type        = string
  default     = ""
  description = "The IP address that will be 1:1 mapped to the instance's network ip. If not given, one will be generated. [Docs Ref.](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#access_config)"
}

variable "instance_name" {
  type        = string
  default     = "example-machine"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

variable "project_region" {
  type        = string
  default     = "us-west1"
  description = "GCP Network Name. [Oficial GCP Documentation](https://cloud.google.com/compute/docs/machine-types) - [Terraform provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#machine_type)"
}

