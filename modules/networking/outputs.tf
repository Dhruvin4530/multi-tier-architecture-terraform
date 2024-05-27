output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "web_subnet1_id" {
  description = "web subnet 1 ID"
  value       = aws_subnet.web-subnet1.id
}

output "web_subnet2_id" {
  description = "web subnet 2 ID"
  value       = aws_subnet.web-subnet2.id
}

output "app_subnet1_id" {
  description = "app subnet 1 ID"
  value       = aws_subnet.app-subnet1.id
}

output "app_subnet2_id" {
  description = "app subnet 2 ID"
  value       = aws_subnet.app-subnet2.id
}

output "db_subnet_group_id" {
  description = "db subnet group id"
  value       = aws_db_subnet_group.subnet-grp.id
}