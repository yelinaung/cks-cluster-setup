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

// IP addresses
resource "google_compute_address" "cks_master_ip" {
  name         = "cks-master-ip"
}

resource "google_compute_address" "cks_worker_ip" {
  name         = "cks-worker-ip"
}
