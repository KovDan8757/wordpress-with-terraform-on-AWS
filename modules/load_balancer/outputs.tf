output "load_balancer_id" {
  description = "Load_balancer_id"
  value       = aws_lb.load_balancer.id
}
output "load_balancer_arn" {
  description = "Load_balancer_arn"
  value       = aws_lb.load_balancer.arn
}
output "load_balancer_url" {
  description = "Load_balancer_url"
  value       = aws_lb.load_balancer.dns_name
}