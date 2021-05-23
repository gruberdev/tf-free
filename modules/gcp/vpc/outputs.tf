output "network_name" {
  value = google_compute_network.default.name
}
output "ipv4_addr" {
  value = google_compute_address.static.address
}
