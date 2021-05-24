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
  project     = var.google_project
  region      = var.gcp_project_region
  credentials = file("gcp.json")
}


