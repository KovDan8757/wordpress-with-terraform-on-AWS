# eip/outputs

output "eip_ids" {
  description = "List of created EIP id's"
  value       = aws_eip.eip.*.id
}