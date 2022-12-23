output "machine_ip" {
  value     = module.gcp_instance.external_ip
  sensitive = true
}

output "bucket_result" {
  value =  "To transfer files to your bucket ${module.gcp_storage.bucket_name} use this command: gcloud storage cp filename_to_transfer gs://${module.gcp_storage.bucket_name}/"
}
