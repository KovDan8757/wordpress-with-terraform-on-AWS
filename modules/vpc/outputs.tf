# vpc/outputs

output "vpc_id" {
  description = "id of the created vpc"
  value       = aws_vpc.vpc_id.id
}