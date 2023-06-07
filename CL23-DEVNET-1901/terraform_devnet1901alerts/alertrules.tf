resource "thousandeyes_alert_rule" "AppBGPAlert" {
  rule_name = "CL23 App - BGP Alert"
  alert_type = "BGP"
  expression = "[(((prefixLengthIPv4 >= 16) && (prefixLengthIPv4 <= 32)) || ((prefixLengthIPv6 >= 32) && (prefixLengthIPv6 <= 128)))]((reachability < 100%) || (changes > 1))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1 
  minimum_sources_pct = 10
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppHTTPAlert" {
  rule_name = "CL23 App - HTTP Alert"
  alert_type = "HTTP Server"
  expression = "((errorType != \"None\"))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1 
  minimum_sources = 3
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppDNStraceAlert" {
  rule_name = "CL23 App - DNS Trace Alert"
  alert_type = "DNS Trace"
  expression = "((probDetail != \"\"))"
  rounds_violating_out_of = 3
  rounds_violating_required = 3
  minimum_sources = 1
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppDNSAlert" {
  rule_name = "CL23 App - DNS Server Alert"
  alert_type = "DNS Server"
  expression = "((probDetail != \"\"))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1
  minimum_sources = 3
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppSSLExpiryAlert" {
  rule_name = "CL23 App - SSLcertificate Expiry"
  alert_type = "HTTP Server"
  expression = "((certificateValidity <= 30 day))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1
  minimum_sources = 1
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppPageLoadAlert" {
  rule_name = "CL23 App - PageLoad Alert"
  alert_type = "Page Load"
  expression = "((pageLoadHasError == true) || (pageLoadTimedOut == true))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1
  minimum_sources = 3
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppA2AAlert" {
  rule_name = "CL23 App - Network A2A Alert"
  alert_type = "End-to-End (Agent)"
  expression = "((bothWaysLoss >= 5%) || (bothWaysJitter >= 5 ms) || (bothWaysLatency >= 100 ms))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1
  minimum_sources = 3
  direction = "BIDIRECTIONAL"
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}

resource "thousandeyes_alert_rule" "AppA2SAlert" {
  rule_name = "CL23 App - Network A2S Alert"
  alert_type = "End-to-End (Server)"
  expression = "((loss >= 20%) || (avgLatency >= 300 ms) || (jitter >= 50 ms))"
  rounds_violating_out_of = 1
  rounds_violating_required = 1
  minimum_sources = 3
  notifications {
    third_party {
      integration_id = data.thousandeyes_integration.slack.integration_id
      integration_type = data.thousandeyes_integration.slack.integration_type
    }
  }
}