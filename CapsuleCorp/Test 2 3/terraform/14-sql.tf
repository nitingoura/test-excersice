module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "3.4.0"

  identifier = "app-${local.naming_convention}-db"

  create_db_parameter_group = false

  engine         = var.db_engine_type
  engine_version = var.db_engine_version
  port           = var.db_port

  instance_class    = var.db_instance_class
  allocated_storage = var.db_storage
  storage_encrypted = true

  username = "postgres"
  password = random_password.password.result

  vpc_security_group_ids = module.db_sg.security_group_id
  subnet_ids             = module.vpc.private_subnets

  maintenance_window      = "Fri:11:00-Sat:02:00"
  backup_window           = "02:01-04:00"
  backup_retention_period = 35

  monitoring_interval    = "30"
  create_monitoring_role = true
  monitoring_role_name   = "app-${local.naming_convention}-db-monitoring-role"

  iam_database_authentication_enabled = true
  deletion_protection                 = true
  multi_az                            = true
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
  upper            = true
  lower            = true
  number           = true

  lifecycle {
    ignore_changes = [
      result
    ]
  }
}
