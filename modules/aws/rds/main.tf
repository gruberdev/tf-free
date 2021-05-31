data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_db_subnet_group" "example" {
  name       = var.subnet_group_name
  subnet_ids = data.aws_subnet_ids.all.ids
}

resource "aws_security_group" "db_instance" {
  name = var.db_security_group_name
}

resource "aws_security_group_rule" "allow_db_access" {
  type              = "ingress"
  from_port         = "5432"
  to_port           = "5432"
  protocol          = "tcp"
  security_group_id = aws_security_group.db_instance.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_instance" "rds" {
  identifier             = "tf-free-database"
  engine                 = var.db_engine
  engine_version         = var.engine_version
  port                   = "5432"
  name                   = var.name
  username               = var.db_user
  password               = var.db_password
  instance_class         = var.db_instance_type
  allocated_storage      = "20"
  skip_final_snapshot    = true
  license_model          = var.license
  db_subnet_group_name   = var.subnet_group_name
  vpc_security_group_ids = [aws_security_group.db_instance.id]
  publicly_accessible    = false
}
