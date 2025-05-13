variable "asg_name" {
  description = "Auto Scaling Group name"
  type        = string
}

variable "db_identifier" {
  description = "RDS database identifier"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}