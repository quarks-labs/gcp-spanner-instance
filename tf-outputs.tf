output "name" {
  value = google_spanner_instance.this.display_name
}

output "region" {
  value = google_spanner_instance.this.config
}