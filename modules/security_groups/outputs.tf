# security_groups/outputs

output "secgp_id" {
  description = "id of created security group"
  value       = aws_security_group.secgp.id
}