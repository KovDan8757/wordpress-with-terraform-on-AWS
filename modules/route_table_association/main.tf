#route_table_associations/main

resource "aws_route_table_association" "rt_association" {
  count          = var.az_count
  subnet_id      = var.subnet_ids[count.index]
  route_table_id = var.rt_ids[count.index]
}
