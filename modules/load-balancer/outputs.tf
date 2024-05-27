output "web_tg_arn" {
  description = "web target group ARN"
  value       = aws_lb_target_group.target-group-web.arn
}

output "app_tg_arn" {
  description = "app target group ARN"
  value       = aws_lb_target_group.target-group-app.arn
}