resource "google_compute_network" "default" {
  name = var.vpc_name
}

resource "google_compute_address" "static" {
  name = var.static_ip_name
}

