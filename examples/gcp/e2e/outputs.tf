output "gcp_public_ip" {
  value     = module.google_cloud.machine_ip
  sensitive = true
}
