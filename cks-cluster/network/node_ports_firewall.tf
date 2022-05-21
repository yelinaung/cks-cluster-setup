resource "google_compute_firewall" "node_ports_firewall" {
  name    = "nodeports"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["30000-40000"]
  }

  source_tags = ["nodeports"]
}
