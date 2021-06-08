
resource "random_string" "namespace" {
  length  = 2
  special = false
  number  = false
  upper   = false
}

resource "random_string" "s3_name" {
  length  = 6
  special = false
  number  = false
  upper   = false
}

resource "random_string" "bucket_name" {
  length  = 10
  special = false
  number  = false
  upper   = false
}

module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version                            = "v0.32.1"
  namespace                          = random_string.namespace.result
  stage                              = var.backend_stage
  name                               = random_string.s3_name.result
  s3_bucket_name                     = random_string.bucket_name.result
  attributes                         = ["state"]
  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = var.backend_destroy
  depends_on = [
    null_resource.backend
  ]
}

resource "null_resource" "backend" {
  triggers = {
    backend_destroy = var.backend_destroy
  }
  lifecycle {
    prevent_destroy = false
  }
  #  depends_on = [
  #    terraform_state_backend
  #  ]
}

module "google_cloud" {
  source         = "./modules/gcp"
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name

  depends_on = [
    module.terraform_state_backend.dynamodb_table_name,
    module.terraform_state_backend.dynamodb_table_id,
    module.terraform_state_backend.terraform_backend_config
  ]
}

module "aws" {
  source = "./modules/aws"
}
