resource "aws_db_subnet_group" "db" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "appdb"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db.name
  vpc_security_group_ids = [var.db_sg_id]
  skip_final_snapshot  = true
}



resource "aws_cloudwatch_metric_alarm" "rds_cpu" {
  alarm_name          = "rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/RDS"
  period             = 300
  statistic          = "Average"
  threshold          = 80
  alarm_actions      = [var.sns_topic_arn]
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.mysql.identifier
  }
}