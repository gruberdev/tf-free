output "bucket_name" {
  description = "Name of the GCS bucket that will receive the objects."
  value       = google_storage_bucket.default.name
}
