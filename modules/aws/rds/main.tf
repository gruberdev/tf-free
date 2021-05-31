resource "aws_security_group" "security_group" {
  name   = "terratest-example"
  vpc_id = data.aws_vpc.default.id

}

resource "aws_security_group_rule" "allow_db_access" {
  type              = "ingress"
  from_port         = "3306"
  to_port           = "3306"
  protocol          = "tcp"
  security_group_id = aws_security_group.db_instance.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_instance" "rds" {
  identifier             = "terratest-example"
  engine                 = "mysql"
  engine_version         = "8.0.23"
  port                   = "3306"
  name                   = "testmysqldatabase"
  username               = "test_mysql_db"
  password               = var.password
  instance_class         = "db.t2.micro"
  allocated_storage      = "5"
  skip_final_snapshot    = true
  license_model          = "general-public-license"
  db_subnet_group_name   = aws_db_subnet_group.example.id
  vpc_security_group_ids = [aws_security_group.db_instance.id]
  publicly_accessible    = true
  parameter_group_name   = aws_db_parameter_group.example.id
  option_group_name      = aws_db_option_group.example.id
}
