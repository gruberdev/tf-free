provider "google" {
  region  = var.gcp_project_region
}
provider "google-beta" {
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

output "instance_id" {
  value = google_compute_instance.gcp_example.instance_id
}
output "resulting_name" {
  value = google_compute_instance.gcp_example.name
}
output "resulting_type" {
  value = google_compute_instance.gcp_example.machine_type
}


