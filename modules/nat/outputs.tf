# nat/outputs

output "nat_id" {
  description = "List of created NAT gateway id's"
  value       = aws_nat_gateway.nat.*.id
}