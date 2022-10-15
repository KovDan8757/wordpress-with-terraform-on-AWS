# security_groups/main

resource "aws_security_group" "secgp" {
  name   = var.secgp_name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.rules
    content {
      description     = ingress.value.description
      from_port       = ingress.value.port
      to_port         = ingress.value.port
      protocol        = "tcp"
      cidr_blocks     = ingress.value.cidr_blocks
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name  = var.secgp_name
    owner = var.owner
  }
}
