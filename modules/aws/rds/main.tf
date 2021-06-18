
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"

  name        = var.name
  description = "Complete PostgreSQL example security group"
  vpc_id      = var.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = var.vpc_cidr_block
    },
  ]
}

module "db_default" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${var.name}-default"

  create_db_option_group    = false
  create_db_parameter_group = false

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = var.db_engine
  engine_version       = var.db_version
  family               = var.db_family # DB parameter group
  major_engine_version = var.db_major_engine         # DB option group
  instance_class       = var.db_instance_type

  allocated_storage = var.disk_size

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  name                   = "${var.db_name}"
  username               = var.db_user
  create_random_password = true
  random_password_length = 12
  port                   = 5432

  subnet_ids             = var.vpc_subnet_ids
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 0 // no backup
}
