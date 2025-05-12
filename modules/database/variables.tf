variable "private_subnet_ids" { type = list(string) }
variable "db_sg_id" {}
variable "db_username" {}
variable "db_password" { sensitive = true }