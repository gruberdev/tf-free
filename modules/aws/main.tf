provider "aws" {
  profile    = var.profile
  access_key = var.account_id
  secret_key = var.account_key
  region     = var.region
}

module "vpc" {
  source = "./vpc"
}

module "public_subnet" {
  source = "./subnet"

  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./gateway"

  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./firewall"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.public_subnet.public_subnet_id
}

module "ec2" {
  source = "./ec2"

  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.public_subnet.public_subnet_id

  ec2_ssh_key_name        = var.ec2_ssh_key_name
  ec2_ssh_public_key_path = var.ec2_ssh_public_key_path
}
