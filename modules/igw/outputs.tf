# igw/outputs

output "igw_id" {
  description = "id of created igw"
  value       = aws_internet_gateway.igw.id
}