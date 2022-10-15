variable "target_group_name" {
  description = "Name tag value of target group"
  type        = string
}
variable "owner" {
  description = "owner tag value"
  type        = string
}
variable "vpc_id" {
  description = "id of the created vpc"
  type        = string
}
variable "ec2_ids" {
  description = "EC2_ids"
  type        = list(string)
}