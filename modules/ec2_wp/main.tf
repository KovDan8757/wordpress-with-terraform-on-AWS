resource "aws_instance" "ec2_wp" {
  count                       = var.az_count
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id[count.index]
  user_data = templatefile("${path.module}/docker.sh.tmpl",
    {
      rds_address = var.rds_address
      efs_address = var.efs_address
  })

  tags = {
    Name  = var.ec2_names[count.index]
    owner = var.owner
  }
}