provider "google-beta" {
  project     = var.google_project
  region      = var.gcp_project_region
  credentials = file("gcp.json")
}

module "gcp_machine" {
  source         = "github.com/gruberdev/tf-free/modules/gcp"
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
  google_project = var.google_project
  network_name   = var.main_network_name
}
