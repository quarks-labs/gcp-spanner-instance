resource "google_spanner_instance" "this" {
  config           = try(var.region, "regional-us-east5")
  display_name     = try(var.name, "")
  processing_units = try(var.processing_units, 100)
  project          = var.project
}

resource "google_spanner_database" "this" {
  for_each                 = { for idx, database in var.databases : idx => database }
  instance                 = google_spanner_instance.this.name
  name                     = each.value.name
  version_retention_period = try(each.value.version_retention_period, "3d")
  ddl                      = try(toset(each.value.ddl), [""])
  enable_drop_protection   = try(each.value.enable_drop_protection, false)
  deletion_protection      = try(each.value.deletion_protection, false)
  encryption_config {
    kms_key_name = try(var.encryption_config.kms_key_name, "")
  }
}
