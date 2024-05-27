# app auto scaling group
resource "aws_autoscaling_group" "asg-web" {
  name                = var.asg_web_name
  desired_capacity    = var.web_desired_capacity
  max_size            = var.web_max_size
  min_size            = var.web_min_size
  target_group_arns   = [var.web_tg_arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [var.web_subnet1_id, var.web_subnet2_id]


  launch_template {
    id      = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }
}

# web auto scaling group
resource "aws_autoscaling_group" "asg-app" {
  name                = var.asg_app_name
  desired_capacity    = var.app_desired_capacity
  max_size            = var.app_max_size
  min_size            = var.app_min_size
  target_group_arns   = [var.app_tg_arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [var.app_subnet1_id, var.app_subnet2_id]


  launch_template {
    id      = aws_launch_template.template-app.id
    version = aws_launch_template.template-app.latest_version
  }
}