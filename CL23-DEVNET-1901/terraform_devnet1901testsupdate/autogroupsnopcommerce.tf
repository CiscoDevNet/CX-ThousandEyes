locals {
  nopcommerce = jsondecode(file("${path.module}/groupsnopcommerce.json"))
  nopcommerce_test_id = [for test_id in local.nopcommerce.groups : test_id.tests[*].testId]
  nopcommerce_test_type = [for test_type in local.nopcommerce.groups : test_type.tests[*].type]
  nopcommerce_test_name = [for test_name in local.nopcommerce.groups : test_name.tests[*].testName]
  server_dns = csvdecode(file("${path.module}/dnsservers.csv"))
  server_dns_name_id = {for dns in local.server_dns : dns.dns => dns.dns}
  server_dns_name = keys(local.server_dns_name_id)
  server_dns_id = values(local.server_dns_name_id)
}