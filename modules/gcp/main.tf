

module "gcp_vpc" {
  source         = "./vpc"
  google_project = var.google_project
}

module "gcp_firewall" {
  depends_on = [
    module.gcp_vpc.network_name
  ]
  source       = "github.com/gruberdev/module/gcp/compute/firewall"
  network_name = module.gcp_vpc.network_name
}

module "gcp_instance" {
  depends_on = [
    module.gcp_vpc.network_name,
    module.gcp_vpc.ipv4_add
  ]
  source       = "github.com/gruberdev/module/gcp/compute"
  name         = var.instance_name
  region       = var.project_region
  network_name = module.gcp_vpc.network_name
  ip_addr      = module.gcp_vpc.ipv4_addr
}
