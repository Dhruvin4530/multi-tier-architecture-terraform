# web alb
resource "aws_lb" "alb-web" {
  name               = var.alb_web_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.web_alb_security_group_id]
  subnets            = [var.web_subnet1_id, var.web_subnet2_id]
}

# app alb
resource "aws_lb" "alb-app" {
  name               = var.alb_app_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.app_alb_security_group_id]
  subnets            = [var.app_subnet1_id, var.app_subnet2_id]
}

# web target group
resource "aws_lb_target_group" "target-group-web" {
  name     = var.tg_web_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path    = "/"
    matcher = 200

  }
}

# app target group
resource "aws_lb_target_group" "target-group-app" {
  name     = var.tg_app_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path    = "/"
    matcher = 200

  }
}

# web listener
resource "aws_lb_listener" "alb_listener-web" {
  load_balancer_arn = aws_lb.alb-web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-web.arn
  }
}

# app listener
resource "aws_lb_listener" "alb_listener-app" {
  load_balancer_arn = aws_lb.alb-app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-app.arn
  }
}