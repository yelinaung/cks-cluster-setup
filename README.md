# CKS Cluster

This is the sample Kubernetes cluster provisioned by Terraform on GCP.

### Setup
- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- Follow [Terraform GCP tutorial](https://learn.hashicorp.com/tutorials/terraform/google-cloud-platform-build#set-up-gcp=) for GCP specific Terraform setup.

- Init the Network module
```bash
cd network && terraform init
```
- Example [tfvars file](https://www.terraform.io/language/values/variables#variable-definitions-tfvars-files=)

```hcl
credentials = "<PATH TO YOUR SERVICE ACCOUNT JSON FILE>"
gcp_project = "<GCP PROJECT NAME>"

region = "<GCP REGION>"
zone   = "<GCP ZONE>"

# Network Variables
network_name           = "<NETWORK NAME>"
network_description    = "<NETWORK DESCRIPTION>"
subnet_name_cks        = "<SUBNET NAME>"
subnet_cks_description = "<SUBNET DESCRIPTION>"
ip_cidr_range_cks      = "<CIDR RANGE>"

# Firewall Variables
cks_firewall_name = "<FIREWALL NAME>"
```
