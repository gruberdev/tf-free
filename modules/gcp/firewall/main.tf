resource "google_compute_firewall" "allow_web" {
  provider = google-beta
  name     = var.firewall_web_name
  network  = var.network_name


  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}

resource "google_compute_firewall" "allow_ssh" {
  provider = google-beta
  name     = var.firewall_ssh_name
  network  = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
