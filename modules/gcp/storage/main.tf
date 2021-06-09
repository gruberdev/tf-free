locals {
  default_role_entities = [
    "OWNER:project-owners-${data.google_project.current.number}",
    "OWNER:project-editors-${data.google_project.current.number}",
    "READER:project-viewers-${data.google_project.current.number}",
    "READER:allUsers",
  ]
}

resource "google_storage_bucket" "default" {
  project       = var.project_id
  name          = var.name
  storage_class = var.storage_class
  force_destroy = var.enable_destroy
}

resource "google_storage_bucket_acl" "default" {
  bucket      = google_storage_bucket.default.name
  default_acl = var.permissions
  role_entity = local.default_role_entities
}
