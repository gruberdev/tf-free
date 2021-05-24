resource "google_compute_network" "default" {
  name                    = var.vpc_name
  auto_create_subnetworks = "true"
  project                 = var.google_zproject
}

resource "google_compute_address" "static" {
  name    = var.static_ip_name
  project = var.google_project
}

