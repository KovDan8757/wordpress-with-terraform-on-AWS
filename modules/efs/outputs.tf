output "efs_address" {
  value = aws_efs_file_system.academy_efs.dns_name
}