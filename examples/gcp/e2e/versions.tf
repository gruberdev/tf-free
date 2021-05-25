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
  region      = var.gcp_project_region
  credentials = file("gcp.json")
}


