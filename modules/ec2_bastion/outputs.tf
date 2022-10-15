output "ec2_bastion_ids" {
  description = "EC2_wordpress ids"
  value       = aws_instance.ec2_bastion.*.id
}

output "ec2_bastion_ips" {
  description = "EC2_wordpress ips"
  value       = aws_instance.ec2_bastion.*.public_ip
}