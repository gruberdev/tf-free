provider "google" {
  region = var.gcp_project_region
}
provider "google-beta" {
  region = var.gcp_project_region
}

module "google_cloud" {
  source         = "../../../modules/gcp"
  gcp_project_id = var.gcp_project_id
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
  permissions    = var.gcp_storage_permissions
  bucket_name    = var.gcp_bucket_name
  network_name   = var.gcp_network_name
}
