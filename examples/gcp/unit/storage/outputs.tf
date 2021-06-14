output "bucket_name" {
  description = "Name of the GCS bucket that will receive the objects."
  value       = module.gcp_storage.bucket_name

}
