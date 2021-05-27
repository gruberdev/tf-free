resource "aws_subnet" "public_subnet" {
  count                   = var.subnet_should_be_created ? 1 : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.subnet_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}
