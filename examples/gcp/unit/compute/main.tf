terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.68.0"
    }
  }
}

provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_instance_region
  credentials = file("gcp.json")
}

module "gcp_instance" {
  source = "github.com/gruberdev/tf-free/modules/gcp/compute"
}

