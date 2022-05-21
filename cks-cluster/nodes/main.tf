terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.20.0"
    }
  }
}

provider "google" {
  credentials = file("${var.credentials}")
  project     = var.gcp_project
  region      = var.region
}
