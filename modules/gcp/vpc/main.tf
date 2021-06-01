
resource "google_compute_network" "default" {
  name                    = var.vpc_name
  auto_create_subnetworks = "true"
}

resource "google_compute_address" "static" {
  provider = google-beta
  name     = var.static_ip_name
}

