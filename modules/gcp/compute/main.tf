resource "google_compute_instance" "gcp_example" {
  provider     = google-beta
  name         = var.name
  machine_type = var.type
  zone         = "${var.region}-b"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = var.network_name
    access_config {
      nat_ip = var.ip_addr
    }
  }
}
