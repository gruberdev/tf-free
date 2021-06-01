

module "gcp_vpc" {
  vpc_name       = var.network_name
  source         = "./vpc"
  static_ip_name = var.instance_ipv4_name
  google_project = var.google_project
}

module "gcp_firewall" {
  depends_on = [
    module.gcp_vpc.network_name
  ]
  source       = "./firewall"
  network_name = module.gcp_vpc.network_name
}

module "gcp_instance" {
  depends_on = [
    module.gcp_vpc.network_name,
    module.gcp_vpc.ipv4_add
  ]
  source       = "./compute"
  name         = var.instance_name
  region       = var.project_region
  network_name = module.gcp_vpc.network_name
  ip_addr      = module.gcp_vpc.ipv4_addr
}
