variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "web_sg_id" {}
variable "lb_sg_id" {}
variable "vpc_id" {
  description = "VPC ID for resources"
  type        = string
}
variable "user_data" {}