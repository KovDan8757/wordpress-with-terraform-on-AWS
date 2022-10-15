# vpc/main

resource "aws_vpc" "vpc_id" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name  = var.vpc_name
    owner = var.owner
  }
}
