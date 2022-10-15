# load_balancer

resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = var.secgp_lb
  subnets            = var.subnet_ids
  tags = {
    Name  = var.load_balancer_name
    owner = var.owner
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}