terraform {
  required_version = ">= 1.00
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.47.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
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
