# subnet/outputs

output "subnet_ids" {
  description = "List of created subnet id's"
  value       = aws_subnet.subnets.*.id
}