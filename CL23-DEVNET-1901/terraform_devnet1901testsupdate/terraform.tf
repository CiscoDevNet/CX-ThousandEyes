terraform {

  cloud {
    organization = "YOUR_TERRAFORM_CLOUD_ORGANIZATION"

    workspaces {
      name = "YOUR__TERRAFORM_CLOUD_WORKSPACE_testsupdate"
    }
  }

  required_providers {
    thousandeyes = {
      source = "thousandeyes/thousandeyes"
      version = "2.0.1"
    }
  }

  required_version = ">= 0.14.0"
}