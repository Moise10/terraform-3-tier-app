variable "private_subnet_ids" { type = list(string) }
variable "db_sg_id" {}
variable "db_username" {}
variable "db_password" { sensitive = true }

variable "sns_topic_arn" {
  description = "ARN of SNS topic for alerts"
  type        = string
}