output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}


output "db_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.mysql.identifier
}