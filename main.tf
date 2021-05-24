
resource "google_project_service" "network_api" {
  project                    = var.google_project
  disable_dependent_services = true
  service                    = "networkmanagement.googleapis.com"
}
resource "google_project_service" "enable_billing_api" {
  project                    = var.google_project
  service                    = "cloudbilling.googleapis.com"
  disable_dependent_services = true
}
resource "google_project_service" "enable_admin_api" {
  project                    = var.google_project
  service                    = "admin.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_api" {
  project                    = var.google_project
  service                    = "iam.googleapis.com"
  disable_dependent_services = true
}
resource "google_project_service" "control_api" {
  project                    = var.google_project
  service                    = "servicecontrol.googleapis.com"
  disable_dependent_services = true
}
resource "google_project_service" "management_api" {
  project                    = var.google_project
  service                    = "servicemanagement.googleapis.com"
  disable_dependent_services = true
}

module "gcp_machine" {
  source         = "./modules/gcp"
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
}
