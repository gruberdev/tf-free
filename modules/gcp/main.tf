
module "gcp_vpc" {
  source = "github.com/gruberdev/tf-free/modules/vpc"
}

module "gcp_firewall" {
  source       = "github.com/gruberdev/tf-free/modules/firewall"
  network_name = module.gcp_vpc.network_name
}

module "gcp_instance" {
  source       = "github.com/gruberdev/tf-free/modules/gcp/compute"
  name         = var.instance_name
  region       = var.project_region
  network_name = module.gcp_vpc.network_name
  ip_addr      = module.gcp_vpc.ipv4_addr
}
