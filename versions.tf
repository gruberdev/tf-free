terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.68.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.60.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "example"
  secret_key = "example"
}

provider "google" {
  project     = var.google_project
  region      = var.gcp_project_region
  credentials = file("gcp.json")
}

provider "azurerm" {
  features {}
}
