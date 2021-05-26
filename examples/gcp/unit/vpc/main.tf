

provider "google-beta" {
  project     = var.google_project
  region      = var.project_region
  credentials = file("gcp.json")
}

module "gcp_vpc" {
  source         = "github.com/gruberdev/tf-free/modules/gcp/vpc"
  google_project = var.google_project
}

module "gcp_firewall" {
  depends_on = [
    module.gcp_vpc.network_name
  ]
  source       = "github.com/gruberdev/tf-free/modules/gcp/firewall"
  network_name = module.gcp_vpc.network_name
}
