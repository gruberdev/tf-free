provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}
provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}

resource "google_compute_instance" "gcp_example" {
  name         = var.gcp_instance_name
  machine_type = "f1-micro"
  zone         = "${var.gcp_project_region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 30
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
  tags = [
    "web",
    "ssh"
  ]
}
