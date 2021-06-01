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
  vpc_id = module.vpc.id
}

module "internet_gateway" {
  source = "./gateway"

  vpc_id = module.vpc.id
}

module "route_table" {
  source = "./firewall"

  vpc_id              = module.vpc.id
  internet_gateway_id = module.internet_gateway.id
  public_subnet_id    = module.public_subnet.id
}

module "ec2" {
  source = "./ec2"

  vpc_id           = module.vpc.id
  public_subnet_id = module.public_subnet.id

  ssh_name   = var.ec2_ssh_name
  ssh_public = var.ec2_ssh_public
}

module "rds" {
  source      = "./rds"
  db_user     = "testing"
  db_password = "testingpassword123"
}