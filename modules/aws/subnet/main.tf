resource "aws_subnet" "public_subnet" {
  count                   = var.should_be_created ? 1 : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.name
  }
}

