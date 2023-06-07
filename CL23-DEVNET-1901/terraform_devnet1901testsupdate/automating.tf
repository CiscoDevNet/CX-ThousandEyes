resource "thousandeyes_agent_to_agent" "agent_to_agent_internet_azureTE" {
  test_name      = "CL23 App - internet > azureTE"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "986966"
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }  
  dynamic "alert_rules" {
    for_each = var.rId_i_azureTE
    content {
      rule_id = alert_rules.value
    }
  }
  alerts_enabled = true
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "agent_to_agent_internet_OnPremTE" {
  test_name      = "CL23 App - internet > OnPremTE"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "948896"
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_OnPremTE
    content {
      rule_id = alert_rules.value
    }
  }
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_dns_server" "dns_server_internet_nopcommerceDNS" {
  test_name      = "CL23 App - internet > nopcommerceDNS"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  domain = "nopcommerce-demo.eastus.cloudapp.azure.com A"
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_nopcommerceDNS
    content {
      rule_id = alert_rules.value
    }
  }
  dynamic "dns_servers" {
    for_each = local.server_dns_name
    content {
      server_name = dns_servers.value
    }
  }
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_dns_trace" "dns_trace_internet_nopcommerceDNStrace" {
  test_name      = "CL23 App - internet > nopcommerceDNStrace"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  domain = "nopcommerce-demo.eastus.cloudapp.azure.com A"
  alert_rules {
      rule_id = var.rId_i_nopcommerceDNStrace
  }
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_page_load" "page_load_internet_nopcommerceWeb" {
  test_name      = "CL23 App - internet > nopcommerceWeb"
  description    = "by terraform devnet1901 at ${local.now}"
  alerts_enabled = true
  url            = "https://nopcommerce-demo.eastus.cloudapp.azure.com/"
  interval      = var.test_interval
  http_interval = var.test_interval
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_nopcommerceWeb 
    content {
      rule_id = alert_rules.value
    }
  }
  dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_http_server" "http_server_internet_thousandeyes" {
  test_name =  "CL23 App - internet > thousandeyes"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  url = "https://www.thousandeyes.com"
  bgp_measurements = false
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_thousandeyes
    content {
      rule_id = alert_rules.value
    }
  }
 dynamic "agents" {
    for_each = local.agentAddId
    content  {
    agent_id   = agents.value
    }
  }
}

resource "thousandeyes_agent_to_agent" "agent_to_agent_azureTE_OnPremTE" {
  test_name      = "CL23 App - azureTE <> OnPremTE"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  direction = "BIDIRECTIONAL"
  protocol = "TCP"
  target_agent_id = "948896"
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_OnPremTE
    content {
      rule_id = alert_rules.value
    }
  }
  agents {
    agent_id   = 986966
  }
}

resource "thousandeyes_agent_to_server" "agent_to_server_azureTE_OnPremDB" {
  test_name      = "CL23 App - azureTE > OnPremDB"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  server = "172.40.142.21"
  port   = 3306
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_OnPremDB
    content {
      rule_id = alert_rules.value
    }
  }
  agents {
    agent_id   = 986966
  }
}