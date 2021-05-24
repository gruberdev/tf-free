output "instance_id" {
  value = google_compute_instance.gcp_example.instance_id
}
output "instance_internal_ip" {
  value     = google_compute_instance.gcp_example.network_interface.0.network_ip
  sensitive = true
}
output "instance_external_ip" {
  value     = google_compute_instance.gcp_example.network_interface.0.access_config.0.nat_ip
  sensitive = true
}
