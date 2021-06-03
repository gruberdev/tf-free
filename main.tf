module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  namespace                          = "te"
  stage                              = "test"
  name                               = "terraform"
  s3_bucket_name                     = "backendfree"
  attributes                         = ["state"]
  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}


module "google_cloud" {
  source         = "./modules/gcp"
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
}

module "aws" {
  source      = "./modules/aws"
  account_id  = var.aws_account_id
  account_key = var.aws_account_key
}
