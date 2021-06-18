provider "aws" {
  region = var.aws_default_region
}

module "vpc" {
  source = "../../../../modules/aws/vpc"
 region = var.aws_default_region
}
module "rds" {
  source = "../../../../modules/aws/rds"
  count = var.rds_enable ? 1 : 0
  db_user = var.username
  name = var.name
  db_engine = var.engine_name
  db_version = var.engine_version
  region = var.aws_default_region
  db_name = var.database_name
  db_password = var.password
  vpc_id = module.vpc.id
  vpc_cidr_block = module.vpc.cidr_block
  vpc_subnet_ids = ["${module.vpc.database_subnets[0]}", "${module.vpc.database_subnets[1]}"]
}