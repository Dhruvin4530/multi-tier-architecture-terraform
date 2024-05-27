variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "web_subnet1_cidr_block" {
  description = "CIDR for web subnet 1"
  type        = string
}

variable "web_subnet2_cidr_block" {
  description = "CIDR for web subnet 2"
  type        = string
}

variable "web_subnet1_name" {
  description = "web subnet 1 name"
  type        = string
}

variable "web_subnet2_name" {
  description = "web subnet 2 name"
  type        = string
}

variable "app_subnet1_cidr_block" {
  description = "CIDR for app subnet 1"
  type        = string
}

variable "app_subnet2_cidr_block" {
  description = "CIDR for app subnet 2"
  type        = string
}

variable "app_subnet1_name" {
  description = "app subnet 1 name"
  type        = string
}

variable "app_subnet2_name" {
  description = "app subnet 2 name"
  type        = string
}

variable "db_subnet1_cidr_block" {
  description = "CIDR for app subnet 1"
  type        = string
}

variable "db_subnet2_cidr_block" {
  description = "CIDR for app subnet 2"
  type        = string
}

variable "db_subnet1_name" {
  description = "app subnet 1 name"
  type        = string
}

variable "db_subnet2_name" {
  description = "app subnet 2 name"
  type        = string
}

variable "db_subnet_grp_name" {
  description = "DB subnet group name"
  type        = string
}

variable "igw_name" {
  description = "IGW name"
  type        = string
}

variable "nat_gw_name" {
  description = "NAT gateway name"
  type        = string
}

variable "public_rt_name" {
  description = "Public route table name"
  type        = string
}

variable "private_rt_name" {
  description = "Private route table name"
  type        = string
}