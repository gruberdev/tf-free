module "google_cloud" {
  source         = "github.com/gruberdev/tf-free/modules/gcp"
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
}

module "amazon_aws" {
  source      = "./modules/aws"
  account_id  = var.aws_account_id
  account_key = var.aws_account_key
}
