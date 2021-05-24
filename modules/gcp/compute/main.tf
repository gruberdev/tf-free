module "gcp_firewall" {
  source       = "../firewall"
  network_name = module.gcp_vpc.network_name
}

module "gcp_vpc" {
  source = "../vpc"
}

resource "google_compute_instance" "gcp_example" {

  name         = var.name
  machine_type = var.type
  zone         = "${var.region}-a"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = module.gcp_vpc.network_name
    access_config {
      nat_ip = module.gcp_vpc.ipv4_addr
    }
  }
}
