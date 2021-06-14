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

variable "network_name" {
  type        = string
  sensitive   = true
  default     = "gcp-internal-network"
  description = "Your instance's network on GCP. [GCP's Official documentation on naming resources](https://cloud.google.com/compute/docs/naming-resources#resource-name-format)"
}
