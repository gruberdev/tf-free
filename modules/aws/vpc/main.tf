resource "aws_vpc" "vpc" {
  count                = var.vpc_should_be_created ? 1 : 0
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  tags = {
    Name = var.vpc_name
  }
}
