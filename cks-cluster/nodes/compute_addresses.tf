// IP addresses
resource "google_compute_address" "cks_master_ip" {
  name = "cks-master-ip"
}

resource "google_compute_address" "cks_worker_ip" {
  name = "cks-worker-ip"
}
