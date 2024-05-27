variable "alb_app_name" {
  description = "app alb name"
  type        = string
}

variable "app_alb_security_group_id" {
  description = "app alb security group id"
  type        = string
}

variable "app_subnet1_id" {
  description = "app subnet 1 id"
  type        = string
}

variable "app_subnet2_id" {
  description = "app subnet 2 id"
  type        = string
}

variable "alb_web_name" {
  description = "web alb name"
  type        = string
}

variable "web_alb_security_group_id" {
  description = "app alb security group id"
  type        = string
}

variable "web_subnet1_id" {
  description = "app subnet 1 id"
  type        = string
}

variable "web_subnet2_id" {
  description = "app subnet 2 id"
  type        = string
}

variable "tg_web_name" {
  description = "web target group name"
  type        = string
}

variable "tg_app_name" {
  description = "app target group name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
