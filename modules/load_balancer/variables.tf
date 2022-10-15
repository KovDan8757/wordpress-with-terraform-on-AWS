variable "owner" {
  description = "owner tag value"
  type        = string
}
variable "load_balancer_name" {
  description = "Name tag value of load-balancer"
  type        = string
}
variable "secgp_lb" {
  description = "Load_balancer security-group name"
  type        = list(string)
}
variable "target_group_arn" {
  description = "target_group_arn"
  type        = string
}
variable "subnet_ids" {
  description = "(Required) The subnet ID to create load balancer"
  type        = list(string)
  default     = null
}