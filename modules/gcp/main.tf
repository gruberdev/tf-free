
module "gcp_vpc" {
  source = "./vpc"
}

module "gcp_firewall" {
  source       = "./firewall"
  network_name = module.gcp_vpc.network_name
}

module "gcp_instance" {
  source       = "./compute"
  network_name = module.gcp_vpc.network_name
  ip_addr      = module.gcp_vpc.ipv4_addr
}

