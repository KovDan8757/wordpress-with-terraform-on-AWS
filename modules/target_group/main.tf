# target_group_main

resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
  tags = {
    Name  = var.target_group_name
    owner = var.owner
  }
  health_check {
    enabled  = true
    timeout  = 5
    interval = 30
    path     = "/"
    port     = 80
    protocol = "HTTP"
    matcher  = "200-399"
  }

}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  depends_on = [
    aws_lb_target_group.target_group
  ]
  count            = 2
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.ec2_ids[count.index]
  port             = 80
}
