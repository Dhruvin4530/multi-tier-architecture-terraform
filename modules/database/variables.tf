variable "db_name" {
  description = "db name"
  type        = string
}

variable "instance_class" {
  description = "db instance type"
  type        = string
}

variable "db_username" {
  description = "db username"
  type        = string
}

variable "db_password" {
  description = "db password"
  type        = string
}

variable "db_subnet_group_name" {
  description = "db subnet group name"
  type        = string
}

variable "db_sg_name" {
  description = "db security group name"
  type        = string
}