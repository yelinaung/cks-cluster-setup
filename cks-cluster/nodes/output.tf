output "master_node_ip" {
  value       = "${google_compute_instance.cks-master-node.network_interface.0.access_config.0.nat_ip}"
  description = "Master Node IP"
}

output "worker_node_ip" {
  value       = google_compute_instance.cks-worker-node.network_interface.0.access_config.0.nat_ip
  description = "Worker Node IP"
}
