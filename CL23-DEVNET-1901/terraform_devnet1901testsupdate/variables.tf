variable "te_token" {
  description = "ThousandEyes OAuth authentication token"
  type = string
  sensitive = true
}

variable "te_aid" {
  description = "Account Group ID"
  type  = string
}

variable "te_timeout" {
  description = "The timeout value."
  type  = number
}

variable "test_interval" {
  type  = number
}

variable "rId_i_thousandeyes" {
  type  = list(string)
}

variable "rId_i_OnPremTE" {
  type  = list(string)
}

variable "rId_i_nopcommerceWeb" {
  type  = list(string)
}

variable "rId_i_nopcommerceDNStrace" {
  type  = string
}

variable "rId_i_nopcommerceDNS" {
  type  = list(string)
}

variable "rId_i_azureTE" {
  type  = list(string)
}

variable "rId_i_OnPremDB" {
  type  = list(string)
}

variable "bgpmonitors" {
  type  = list(string)
}