# nat/main

resource "aws_nat_gateway" "nat" {
  count         = var.az_count
  allocation_id = var.eip_ids[count.index]
  subnet_id     = var.subnet_ids[count.index]
  tags = {
    Name  = var.nat_names[count.index]
    owner = var.owner
  }
}