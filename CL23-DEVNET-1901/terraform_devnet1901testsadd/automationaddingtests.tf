
resource "thousandeyes_dns_server" "dns_server_azureTE_paypalDNS" {
  test_name      = "CL23 App - azureTE > paypalDNS"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  domain = "api.sandbox.paypal.com CNAME"
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "dns_servers" {
    for_each = local.server_dns_name
    content {
      server_name = dns_servers.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_paypaldns
    content {
      rule_id = alert_rules.value
    }
  }
  agents {
    agent_id   = 986966
  }
}

resource "thousandeyes_dns_trace" "dns_trace_azureTE_paypalDNStrace" {
  test_name      = "CL23 App - azureTE > paypalDNStrace"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  domain = "api.sandbox.paypal.com CNAME"
  alert_rules {
      rule_id = var.rId_i_paypaldnstrace
  }
  agents {
    agent_id   = 986966
  }
}

resource "thousandeyes_http_server" "http_server_azureTE_paypalAPI" {
  test_name =  "CL23 App - azureTE > paypalAPI"
  description    = "by terraform devnet1901 at ${local.now}"
  interval       = var.test_interval
  alerts_enabled = true
  url = var.paypalAPIurl
  bgp_measurements = true
  dynamic "bgp_monitors" {
    for_each = var.bgpmonitors
    content {
      monitor_id = bgp_monitors.value
    }
  }
  dynamic "alert_rules" {
    for_each = var.rId_i_paypalapi 
    content {
      rule_id = alert_rules.value
    }
  }
  auth_type = var.paypalAPIauth
  username = var.paypalAPIuser
  password = var.paypalAPIpass
  agents {
    agent_id   = 986966
  }
}