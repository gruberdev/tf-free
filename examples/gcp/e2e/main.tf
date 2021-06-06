provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_project_region
  credentials = chomp(file("gcp.json"))

}
provider "google-beta" {
  project     = var.gcp_project_id
  region      = var.gcp_project_region
  credentials = chomp(file("gcp.json"))
}

module "google_cloud" {
  source             = "../../../modules/gcp"
  project_region     = var.gcp_project_region
  instance_name      = var.gcp_instance_name
  google_project     = var.gcp_project_id
  network_name       = var.gcp_network_name
  instance_ipv4_name = var.gcp_ipv4_name
}

