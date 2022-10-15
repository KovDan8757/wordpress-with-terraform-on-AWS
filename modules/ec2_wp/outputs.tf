output "ec2_wp_ids" {
  description = "EC2_wordpress ids"
  value       = aws_instance.ec2_wp.*.id
}

output "ec2_wp_ips" {
  description = "EC2_wordpress ips"
  value       = aws_instance.ec2_wp.*.secondary_private_ips
}