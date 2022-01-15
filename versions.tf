terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.71.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

provider "aws" {
  region = var.aws_default_region
}

provider "google" {
  region = var.gcp_project_region
}

provider "google-beta" {
  region = var.gcp_project_region
}

provider "azurerm" {
  features {}
}
