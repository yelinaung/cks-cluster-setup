// resource block defines that exists within the infra
// it could be a physical component like a VM
// or it could be logical one like an application
// here we are creating a resource type and name together
// doc https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "vpc_network" {
  name        = var.network_name
  description = var.network_description

  // this creates the network in custom subnet mode
  auto_create_subnetworks = false
}

// subnet
// https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.subnet_name_cks
  ip_cidr_range = var.ip_cidr_range_cks
  network       = var.network_name
  description   = var.subnet_cks_description
}

// firewall rules
// https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
// for now, we will just create a firewall rule to allow all the traffice both ingress and egress
resource "google_compute_firewall" "all" {
  name    = var.cks_firewall_name
  network = var.network_name
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}
