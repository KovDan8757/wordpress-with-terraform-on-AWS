resource "aws_db_subnet_group" "academy_subnet_group_rds" {
  name       = "academy_subnet_group_rds"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "academy_subnet_group_rds"
  }
}

resource "aws_db_instance" "academy_rds_mysql" {
  engine                  = "mysql"
  engine_version          = "5.7.34"
  identifier              = "academy-rds-mysql"
  username                = var.root_user
  password                = var.root_user_pwd
  instance_class          = "db.t3.micro"
  storage_type            = "gp2"
  allocated_storage       = 20
  max_allocated_storage   = 50
  storage_encrypted       = true
  multi_az                = true
  db_subnet_group_name    = aws_db_subnet_group.academy_subnet_group_rds.id
  vpc_security_group_ids  = var.vpc_security_group_ids
  name                    = "wordpress"
  backup_retention_period = 7
  // monitoring_interval - (Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60.
  // monitoring_role_arn - (Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances.
  // IAM ROLE NEED FOR MONITORING
  skip_final_snapshot        = true
  auto_minor_version_upgrade = true
}