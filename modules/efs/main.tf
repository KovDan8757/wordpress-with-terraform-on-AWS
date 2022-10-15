resource "aws_efs_file_system" "academy_efs" {
  creation_token = "academy_efs"
  encrypted      = true
  tags = {
    Name = "academy_efs"
  }
}

resource "aws_efs_mount_target" "academy_efs_mount" {
  count           = var.az_count
  file_system_id  = aws_efs_file_system.academy_efs.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.vpc_security_group_ids
}