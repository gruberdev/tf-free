provider "aws" {
  region     = var.aws_default_region
}

module "vpc" {
  source = "../../../../modules/aws/vpc"
  name   = "vpc-test-ec2"
}

module "public_subnet" {
  source            = "../../../../modules/aws/subnet"
  name              = "subnet-test-ec2"
  availability_zone = var.subnet_region
  vpc_id            = module.vpc.id
}

module "internet_gateway" {
  source = "../../../../modules/aws/gateway"
  name   = "igw-test-ec2"
  vpc_id = module.vpc.id
}

module "route_table" {
  source = "../../../../modules/aws/firewall"

  name                = "table-test-ec2"
  vpc_id              = module.vpc.id
  internet_gateway_id = module.internet_gateway.id
  public_subnet_id    = module.public_subnet.id
}

module "ec2" {
  source           = "../../../../modules/aws/ec2"
  name             = "ec2-test-ec2"
  vpc_id           = module.vpc.id
  ami              = var.ami_id
  seed_data        = <<EOF
#!/bin/bash
echo "Hello, World!" > index.html
nohup busybox httpd -f -p 80 &
EOF
  public_subnet_id = module.public_subnet.id
  ssh_name         = var.ssh_name
  ssh_public       = var.ssh_public
}
