locals {
  instances = csvdecode(file("${path.module}/supportedFiles/agents.csv"))
}

provider "thousandeyes" {
  token = var.te_token
}

data "thousandeyes_agent" "test_agent" {
  for_each = { for inst in local.instances : inst.agents => inst }
  agent_name = each.value.agents
}

resource "thousandeyes_page_load" "default" {
  for_each = { for inst in local.instances : inst.agents => inst }
  test_name     = "CiscoLive_${each.value.testName}"
  url           = each.value.testUrl
  interval      = 60
  http_interval = 60
  agents {
     agent_id   = each.value.agentId
  }
}

# Commands:

# terraform init 
# terraform plan -var-file te.tfvars
# terraform apply -var-file te.tfvars -auto-approve
