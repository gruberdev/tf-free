data "google_project" "current" {
  project_id = var.project_id
}

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
  location      = "US"
  storage_class = var.storage_class
  force_destroy = var.enable_destroy
}

resource "google_storage_bucket_acl" "default" {
  bucket      = google_storage_bucket.default.name
  default_acl = var.permissions
  role_entity = local.default_role_entities
}

/* resource "google_filestore_instance" "instance" {
  provider = google-beta
  name     = var.firestore_name
  zone     = "${var.region}-b"
  tier     = var.storage_class

  file_shares {
    capacity_gb = var.fire_size
    name        = var.table_name

    nfs_export_options {
      ip_ranges   = ["10.0.0.0/24"]
      access_mode = "READ_WRITE"
      squash_mode = "NO_ROOT_SQUASH"
    }

    nfs_export_options {
      ip_ranges   = ["10.10.0.0/24"]
      access_mode = "READ_ONLY"
      squash_mode = "ROOT_SQUASH"
      anon_uid    = 123
      anon_gid    = 456
    }
  }

  networks {
    network = var.network_name
    modes   = ["MODE_IPV4"]
  }
}
 */
