variable "app_launch_template_name" {
  description = "app launch template name"
  type        = string
}

variable "app_instance_type" {
  description = "app instance type"
  type        = string
}

variable "app_instance_name" {
  description = "app instance name"
  type        = string
}

variable "web_launch_template_name" {
  description = "web launch template name"
  type        = string
}

variable "web_instance_type" {
  description = "web instance type"
  type        = string
}

variable "web_instance_name" {
  description = "web instance name"
  type        = string
}

variable "app_sg_id" {
  description = "security group id for app instances"
  type        = string
}

variable "web_sg_id" {
  description = "security group id for web instances"
  type        = string
}

variable "asg_web_name" {
  description = "web auto scaling group name"
  type        = string
}

variable "asg_app_name" {
  description = "app auto scaling group name"
  type        = string
}

variable "web_desired_capacity" {
  description = "web instances desired count"
  type        = number
}

variable "web_max_size" {
  description = "web instances max count"
  type        = number
}

variable "web_min_size" {
  description = "web instances min size"
  type        = number
}

variable "app_desired_capacity" {
  description = "app instances desired count"
  type        = number
}

variable "app_max_size" {
  description = "app instances max count"
  type        = number
}

variable "app_min_size" {
  description = "app instances min size"
  type        = number
}

variable "web_tg_arn" {
  description = "web target group ARN"
  type        = string
}

variable "app_tg_arn" {
  description = "app target group ARN"
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

variable "web_subnet1_id" {
  description = "app subnet 1 id"
  type        = string
}

variable "web_subnet2_id" {
  description = "app subnet 2 id"
  type        = string
}

variable "key-name" {
  description = "SSH key-pair"
  type        = string
}