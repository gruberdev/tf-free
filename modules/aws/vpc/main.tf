module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "${var.cidr}.0.0/18"

  azs              = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnets   = ["${var.cidr}.0.0/24", "${var.cidr}.1.0/24", "${var.cidr}.2.0/24"]
  private_subnets  = ["${var.cidr}.3.0/24", "${var.cidr}.4.0/24", "${var.cidr}.5.0/24"]
  database_subnets = ["${var.cidr}.7.0/24", "${var.cidr}.8.0/24", "${var.cidr}.9.0/24"]

  create_database_subnet_group = var.db_group_create
  enable_nat_gateway = var.nat
  enable_vpn_gateway = var.vpn
}
