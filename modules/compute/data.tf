# data "aws_ami" "ami_id" {
#   most_recent      = true
#   name_regex       = "bitnami-wordpresspro-6.8.0-r02-linux-debian-12-x86_64-hvm-ebs-nami-*"
  
#   filter {
#     name   = "name"
#     values = ["bitnami-wordpresspro-6.8.0-r02-linux-debian-12-x86_64-hvm-ebs-nami-*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }