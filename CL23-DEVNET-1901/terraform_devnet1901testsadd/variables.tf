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

variable "bgpmonitors" {
  type  = list(string)
}

variable "paypalAPIurl" {
  type  = string
}

variable "paypalAPIauth" {
  type  = string
}

variable "paypalAPIuser" {
  type  = string
}

variable "paypalAPIpass" {
  type  = string
}

variable "rId_i_paypalapi" {
  type  = list(string)
}

variable "rId_i_paypaldnstrace" {
  type  = string
}

variable "rId_i_paypaldns" {
  type  = list(string)
}