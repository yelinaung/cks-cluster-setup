variable "credentials" {}
variable "gcp_project" {}
variable "name" {
  type = string
}
variable "region" {}
variable "zone" {}

# Compute Machines Variables
variable "cks_node_type" {}
variable "cks_node_os" {}
variable "cks_master_node_name" {}
variable "cks_master_node_tags" {}
variable "cks_worker_node_name" {}
variable "cks_worker_node_tags" {}

# Network Variables
variable "network_name" {
  type = string
}
variable "network_description" {}
variable "subnet_name_cks" {}
variable "ip_cidr_range_cks" {}
variable "subnet_cks_description" {}

# Firewall Variables
variable "cks_firewall_name" {}
