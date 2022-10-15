# route_tables/main

resource "aws_route_table" "route_table" {
  count  = var.az_count
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = var.gateway_id
    nat_gateway_id = try(var.nat_gateway_ids[count.index], null)
  }
  tags = {
    Name  = var.rt_names[count.index]
    owner = var.owner
  }
}
