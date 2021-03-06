output "instance_id" {
  value = google_compute_instance.gcp_example.instance_id
}
output "internal_ip" {
  value     = google_compute_instance.gcp_example.network_interface.0.network_ip
  sensitive = true
}
output "external_ip" {
  value     = google_compute_instance.gcp_example.network_interface.0.access_config.0.nat_ip
  sensitive = true
}
output "resulting_name" {
  value     = google_compute_instance.gcp_example.name
  sensitive = true
}
output "resulting_type" {
  value     = google_compute_instance.gcp_example.machine_type
  sensitive = true
}
