module "gcp" {
  source = "github.com/gruberdev/tf-free/modules/gcp/compute"
  name   = var.gcp_instance_name
}
