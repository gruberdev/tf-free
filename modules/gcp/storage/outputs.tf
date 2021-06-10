output "bucket_name" {
  description = "Name of the GCS bucket that will receive the objects."
  value       = google_storage_bucket.default.name
}
/* output "firestore_id" {
  description = "Name of the GCS bucket that will receive the objects."
  value       = google_filestore_instance.instance.id
}
 */
