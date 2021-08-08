resource "random_string" "random" {
  length  = 14
  special = false
}

resource "azurerm_storage_account" "storage" {
  name                     = "${var.storage_account_name}-${random_string.random.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  allow_blob_public_access = false
  min_tls_version          = "TLS1_2"
}