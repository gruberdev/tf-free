module "gcp" {
  source         = "./modules/gcp"
  project_region = var.gcp_project_region
  instance_name  = var.gcp_instance_name
}
