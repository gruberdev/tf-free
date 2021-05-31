resource "aws_security_group_rule" "allow_db_access" {
  type              = "ingress"
  from_port         = "5432"
  to_port           = "5432"
  protocol          = "tcp"
  security_group_id = var.security_group_id
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
  allocated_storage      = "5"
  skip_final_snapshot    = true
  license_model          = var.license
  vpc_security_group_ids = [var.vpc_group_id]
  publicly_accessible    = true
}
