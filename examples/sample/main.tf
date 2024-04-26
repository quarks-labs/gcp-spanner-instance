locals {
  name    = "quarks-labs"
  project = "quarks-labs"
  region  = "regional-us-east5"
}

provider "google" {
  project = local.project
  region  = local.region
}

module "spanner_instance" {
  source           = "../.."
  project          = local.project
  region           = local.region
  name             = local.name
  processing_units = 900
  databases = [{
    name                     = "quarks-labs"
    ddl                      = []
    deletion_protection      = false
    enable_drop_protection   = false
    version_retention_period = "3d"

  }]
}

