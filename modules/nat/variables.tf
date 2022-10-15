# nat/variables

variable "az_count" {
  description = "Number of NAT gateways to create."
  type        = number
  default     = 2
}
variable "nat_names" {
  description = "Name tag values"
  type        = list(string)
  default     = ["academy_nat_az1", "academy_nat_az2"]
}
variable "eip_ids" {
  description = "(Required) The Allocation ID's of the Elastic IP addresses for the gateways."
  type        = list(string)
  default     = null
}
variable "subnet_ids" {
  description = "(Required) The Subnet ID's of the subnets in which to place the gateways."
  type        = list(string)
  default     = null
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}