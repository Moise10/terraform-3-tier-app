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