# route_tables/outputs

output "rt_ids" {
  description = "List of created route table id's"
  value       = aws_route_table.route_table.*.id
}