resource "aws_route_table" "route_table" {
  count  = var.should_be_created ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = concat(aws_route_table.route_table.*.id, [""])[0]
}
