

module "networking" {
  source              = "./modules/networking"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "security" {
  source   = "./modules/security"
  vpc_id   = module.networking.vpc_id
}

module "database" {
  source             = "./modules/database"
  private_subnet_ids = module.networking.private_subnet_ids
  db_sg_id          = module.security.db_sg_id
  db_username       = var.db_credentials.username
  db_password       = var.db_credentials.password
}

module "compute" {
  source            = "./modules/compute"
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  web_sg_id         = module.security.web_sg_id
  lb_sg_id          = module.security.lb_sg_id
  user_data         = templatefile("${path.root}/user-data.sh", {
    db_endpoint = module.database.rds_endpoint
  })
}