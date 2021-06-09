module "gcp_vpc" {
  vpc_name       = var.network_name
  source         = "./vpc"
  static_ip_name = var.instance_ipv4_name
  google_project = var.gcp_project_id
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

module "gcp_storage_bucket" {
  depends_on = [
    module.gcp_vpc.network_name,
    module.gcp_vpc.ipv4_add,
    module.gcp_instance.resulting_name,
  ]
  source      = "./storage"
  project_id  = var.gcp_project_id
  name        = var.bucket_name
  permissions = var.bucket_permissions
}
