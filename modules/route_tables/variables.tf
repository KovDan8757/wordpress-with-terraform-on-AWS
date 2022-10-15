# route_tables/variables

variable "az_count" {
  description = "Number of route tables to create."
  type        = number
  default     = 2
}
variable "vpc_id" {
  description = "(Required) The vpc id to create in"
  type        = string
  default     = null
}
variable "rt_names" {
  description = "Name tag values"
  type        = list(string)
  default     = ["academy_route_table_public_igw_az1", "academy_route_table_public_igw_az1"]
}
variable "gateway_id" {
  description = "Target internet gateway id for route"
  type        = string
  default     = null
}
variable "nat_gateway_ids" {
  description = "List of target NAT gateway id's for route"
  type        = list(string)
  default     = null
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}


