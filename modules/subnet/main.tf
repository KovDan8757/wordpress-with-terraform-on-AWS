# subnet/main

resource "aws_subnet" "subnets" {
  count                   = var.az_count
  vpc_id                  = var.vpc_id
  availability_zone       = var.az_list.names[count.index]
  cidr_block              = var.subnet_cidrs[count.index]
  map_public_ip_on_launch = var.is_public
  tags = {
    Name  = var.subnet_names[count.index]
    owner = var.owner
  }
}