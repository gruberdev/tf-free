provider "google" {
  region = var.gcp_project_region
}
provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}

module "gcp_storage_bucket" {
  source      = "./storage"
  project_id  = var.gcp_project_id
  name        = var.bucket_name
  permissions = var.bucket_permissions
}
