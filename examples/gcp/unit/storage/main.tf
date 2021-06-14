provider "google" {
  region = var.gcp_project_region
}
provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}

module "gcp_vpc" {
  vpc_name       = var.gcp_network_name
  source         = "../../../../modules/gcp/vpc"
  google_project = var.gcp_project_id
}

module "gcp_storage" {
  depends_on = [
    module.gcp_vpc.network_name,
  ]
  source      = "../../../../modules/gcp/storage"
  project_id  = var.gcp_project_id
  name        = var.bucket_name
  permissions = var.bucket_permissions
  /*   firestore_name = var.firestore_name */
  region       = var.gcp_project_region
  network_name = module.gcp_vpc.network_name
}

output "bucket_name" {
  description = "Name of the GCS bucket that will receive the objects."
  value       = module.gcp_storage.bucket_name
}
