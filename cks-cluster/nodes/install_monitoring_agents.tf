module "cloud-operations_agent-policy" {
  source     = "terraform-google-modules/cloud-operations/google//modules/agent-policy"
  version    = "0.2.3"
  project_id = var.gcp_project
  policy_id  = "ops-agents-policy"
  agent_rules = [
    {
      type               = "ops-agent"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
    {
      type               = "logging"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
    {
      type               = "metrics"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
  ]
  group_labels = [
    {
      env        = "prod"
      monitoring = "true"
      logging    = "true"
    }
  ]
  os_types = [
    {
      short_name = "ubuntu"
      version    = "22.04"
    },
  ]
}
