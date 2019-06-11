# Terraform version and plugin versions

terraform {
  required_version = ">= 0.11.0"
}

provider "local" {
  version = "~> 1.0"
}

provider "template" {
  version = "~> 1.0"
}

provider "vultr" {
  version = "~> 0.1.0"
}
