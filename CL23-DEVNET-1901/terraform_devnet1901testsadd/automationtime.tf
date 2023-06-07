locals {
  timenow = timestamp()
  now = formatdate("hh:mm:ss ZZZ - MMM/DD/YYYY", local.timenow)
}