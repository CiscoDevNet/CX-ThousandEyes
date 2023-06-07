locals {
  cloudagents = jsondecode(file("${path.module}/cloudagents.json")) 
  cloudagentsadd = csvdecode(file("${path.module}/cloudagentsadd.csv"))
  agents_name_id = {for ag_name in local.cloudagents.agents : ag_name.agentName => ag_name.agentId}
  agentName = keys(local.agents_name_id)
  agentId = values(local.agents_name_id) 
  agents_add_name_id = {for ag_add_name in local.cloudagentsadd : ag_add_name.agents => ag_add_name.agent_id}
  agentAddName = keys(local.agents_add_name_id)
  agentAddId = values(local.agents_add_name_id) 
  }
