variable "vpc_id" {
  description = "VPC Id"
  type        = string
}

variable "alb_sg_app_name" {
  description = "App ALB security group name"
  type        = string
}

variable "alb_sg_web_name" {
  description = "Web ALB security group name"
  type        = string
}

variable "asg_sg_web_name" {
  description = "ASG web security group name"
  type        = string
}

variable "asg_sg_app_name" {
  description = "ASG app security group name"
  type        = string
}

variable "db_sg_name" {
  description = "DB security group name"
  type        = string
}