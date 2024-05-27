module "vpc" {
  source                 = "./modules/networking"
  vpc_cidr_block         = local.vpc_cidr_block
  vpc_name               = local.vpc_name
  web_subnet1_cidr_block = local.web_subnet1_cidr_block
  web_subnet2_cidr_block = local.web_subnet2_cidr_block
  web_subnet1_name       = local.web_subnet1_name
  web_subnet2_name       = local.web_subnet2_name
  app_subnet1_cidr_block = local.app_subnet1_cidr_block
  app_subnet2_cidr_block = local.app_subnet2_cidr_block
  app_subnet1_name       = local.app_subnet1_name
  app_subnet2_name       = local.app_subnet2_name
  db_subnet1_cidr_block  = local.db_subnet1_cidr_block
  db_subnet2_cidr_block  = local.db_subnet2_cidr_block
  db_subnet1_name        = local.db_subnet1_name
  db_subnet2_name        = local.db_subnet2_name
  db_subnet_grp_name     = local.db_subnet_grp_name
  igw_name               = local.igw_name
  nat_gw_name            = local.nat_gw_name
  public_rt_name         = local.public_rt_name
  private_rt_name        = local.private_rt_name
}

module "key-pair" {
  source   = "./modules/key-pair"
  key_name = local.key_name
}

module "secret" {
  source = "./modules/secrets"
}

module "security-group" {
  source          = "./modules/security-group"
  vpc_id          = module.vpc.vpc_id
  alb_sg_app_name = local.alb_sg_app_name
  alb_sg_web_name = local.alb_sg_web_name
  asg_sg_web_name = local.asg_sg_web_name
  asg_sg_app_name = local.asg_sg_app_name
  db_sg_name      = local.db_sg_name
}

module "database" {
  source               = "./modules/database"
  db_name              = local.db_name
  instance_class       = var.instance_class
  db_username          = local.db_username
  db_password          = module.secret.db_password
  db_subnet_group_name = local.db_subnet_group_name
  db_sg_name           = module.security-group.db_security_group_id
}

module "load-balancer" {
  source                    = "./modules/load-balancer"
  alb_app_name              = local.alb_app_name
  app_alb_security_group_id = module.security-group.app_alb_security_group_id
  app_subnet1_id            = module.vpc.app_subnet1_id
  app_subnet2_id            = module.vpc.app_subnet2_id
  alb_web_name              = local.alb_web_name
  web_alb_security_group_id = module.security-group.web_alb_security_group_id
  web_subnet1_id            = module.vpc.web_subnet1_id
  web_subnet2_id            = module.vpc.web_subnet2_id
  tg_web_name               = local.tg_web_name
  tg_app_name               = local.tg_app_name
  vpc_id                    = module.vpc.vpc_id
}

module "auto-scaling" {
  source                   = "./modules/auto-scaling"
  app_launch_template_name = local.app_launch_template_name
  app_instance_type        = var.app_instance_type
  app_instance_name        = local.app_instance_name
  web_launch_template_name = local.web_launch_template_name
  web_instance_type        = var.web_instance_type
  web_instance_name        = local.web_instance_name
  app_sg_id                = module.security-group.app_asg_security_group_id
  web_sg_id                = module.security-group.web_asg_security_group_id
  asg_web_name             = local.asg_web_name
  asg_app_name             = local.asg_app_name
  web_desired_capacity     = var.web_desired_capacity
  web_max_size             = local.web_max_size
  web_min_size             = local.web_min_size
  app_desired_capacity     = var.app_desired_capacity
  app_max_size             = local.app_max_size
  app_min_size             = local.app_min_size
  web_tg_arn               = module.load-balancer.app_tg_arn
  app_tg_arn               = module.load-balancer.web_tg_arn
  app_subnet1_id           = module.vpc.app_subnet1_id
  app_subnet2_id           = module.vpc.app_subnet2_id
  web_subnet1_id           = module.vpc.web_subnet1_id
  web_subnet2_id           = module.vpc.web_subnet2_id
  key-name                 = module.key-pair.id
}
