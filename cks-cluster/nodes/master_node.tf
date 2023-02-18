resource "google_compute_instance" "cks-master-node" {
  name           = var.cks_master_node_name
  machine_type   = var.cks_node_type
  zone           = var.zone
  tags           = var.cks_master_node_tags
  labels         = var.cks_master_node_labels
  can_ip_forward = true
  desired_status = "RUNNING"

  boot_disk {
    initialize_params {
      image = var.cks_node_os
      size  = "20"
      type  = "pd-ssd"
    }
  }

  // list of service scopes 
  // https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes
  service_account {
    scopes = [
      "compute-rw",
      "storage-ro",
      "service-management",
      "service-control",
      "logging-write",
      "monitoring"
    ]
  }

  // scheduling
  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  // network
  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name_cks
    access_config {
      nat_ip = google_compute_address.cks_master_ip.address
    }
  }

  metadata = {
    ssh-keys = "yelinaung:${file("../kube_installation_files/public_key.pub")}"
  }

  provisioner "file" {
    source      = "../kube_installation_files/install_master.sh"
    destination = "/home/yelinaung/install_master.sh"
    connection {
      host        = google_compute_address.cks_master_ip.address
      type        = "ssh"
      user        = "yelinaung"
      private_key = file("~/.ssh/id_rsa")
      agent       = "false"
    }
  }
}
