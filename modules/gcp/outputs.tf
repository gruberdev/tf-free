output "machine_ip" {
  value     = module.gcp_instance.external_ip
  sensitive = true
}
