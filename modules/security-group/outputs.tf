output "web_alb_security_group_id" {
  description = "web alb security group id"
  value       = aws_security_group.alb-security-group-web.id
}

output "app_alb_security_group_id" {
  description = "app alb security group id"
  value       = aws_security_group.alb-security-group-app.id
}

output "web_asg_security_group_id" {
  description = "web asg security group id"
  value       = aws_security_group.asg-security-group-web.id
}

output "app_asg_security_group_id" {
  description = "app asg security group id"
  value       = aws_security_group.asg-security-group-app.id
}

output "db_security_group_id" {
  description = "db security group id"
  value       = aws_security_group.db-sg.id
}