terraform {
  required_version = ">= 0.13"
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.68.0"
    }
  }
}

provider "google-beta" {
  project     = var.google_project
  region      = var.project_region
  credentials = file("gcp.json")
}

resource "google_compute_instance" "gcp_example" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = "${var.project_region}-b"

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
}
