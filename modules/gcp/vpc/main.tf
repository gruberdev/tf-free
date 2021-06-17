
resource "google_compute_network" "default" {
  name                    = var.vpc_name
  auto_create_subnetworks = "true"
  project                 = var.google_project
}

output "network_name" {
  value = google_compute_network.default.name
}
