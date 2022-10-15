# eip/main

resource "aws_eip" "eip" {
  count = var.az_count
  vpc   = true
  tags = {
    Name  = var.eip_names[count.index]
    owner = var.owner
  }
}
