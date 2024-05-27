variable "instance_class" {
  description = "instance class for db instance"
  type        = string
}

variable "app_instance_type" {
  description = "app instance type"
  type        = string
}

variable "web_instance_type" {
  description = "web instance type"
  type        = string
}

variable "web_desired_capacity" {
  description = "web desired capacity"
  type        = number
}

variable "app_desired_capacity" {
  description = "app desired capacity"
  type        = number
}

variable "region" {
  description = "region"
  type        = string
}