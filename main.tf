module "google_cloud" {
  source         = "./modules/gcp"
  gcp_project_id = var.gcp_project_id
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
  permissions    = var.gcp_storage_permissions
}

module "aws" {
  source = "./modules/aws"
  ec2_enable = var.ec2_aws
  rds_enable = var.rds_aws
}

// module "azure" {
//   source = "./modules/azure"
// }
