
resource "random_string" "namespace" {
  length    = 2
  special   = false
  numberic  = false
  upper     = false
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
  version                            = "0.38.1"
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
     prevent_destroy = true
  }
}

module "google_cloud" {
  source         = "./modules/gcp"
  gcp_project_id = var.gcp_project_id
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
  permissions    = var.gcp_storage_permissions

  depends_on = [
    module.terraform_state_backend.dynamodb_table_name,
    module.terraform_state_backend.dynamodb_table_id,
    module.terraform_state_backend.terraform_backend_config
  ]
}

module "aws" {
  source = "./modules/aws"
  ec2_enable = var.ec2_aws
  rds_enable = var.rds_aws
}

// module "azure" {
//   source = "./modules/azure"
// }