module "vpc" {
 source = "./vpc"
 region = var.region
}

module "ec2" {
  source = "./ec2"
  count = var.ec2_enable ? 1 : 0
 
  vpc_id           = module.vpc.id
  public_subnet_id = module.vpc.public_subnets[0]

  ssh_name   = var.ec2_ssh_name
  ssh_public = file(var.ec2_ssh_public)
  depends_on = [
    module.vpc.public_subnets
  ]
}

module "rds" {
  source = "./rds"
  count = var.rds_enable ? 1 : 0

  region = var.region
  vpc_id = module.vpc.id
  vpc_cidr_block = module.vpc.cidr_block
  vpc_subnet_ids = ["${module.vpc.database_subnets[0]}", "${module.vpc.database_subnets[1]}"]
}
