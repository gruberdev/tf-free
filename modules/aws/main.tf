provider "aws" {
  profile    = var.profile
  access_key = var.account_id
  secret_key = var.account_key
  region     = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1f", "us-east-1c", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway           = true
  enable_vpn_gateway           = true
  create_database_subnet_group = true


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2" {
  source = "./ec2"

  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets[0]

  ssh_name   = var.ec2_ssh_name
  ssh_public = file(var.ec2_ssh_public)
  depends_on = [
    module.vpc.public_subnets
  ]
}

module "rds" {
  source           = "./rds"
  vpc_id           = module.vpc.vpc_id
  cidr_blocks      = module.vpc.vpc_cidr_block
  database_subnets = module.vpc.database_subnets
}
