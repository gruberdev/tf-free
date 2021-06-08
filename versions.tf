terraform {
  required_version = ">= 0.13"
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.71.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.62.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "example"
  secret_key = "example"
}

provider "google-beta" {
  project     = var.google_project
  region      = var.gcp_project_region
  credentials = file("gcp.json")
}

provider "azurerm" {
  features {}
}
