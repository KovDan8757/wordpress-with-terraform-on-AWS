#route_table_associations/variables

variable "az_count" {
  description = "Number of route table associations to create."
  type        = number
  default     = 2
}
variable "subnet_ids" {
  description = "(Required) The subnet ID to create an association."
  type        = list(string)
  default     = null
}
variable "rt_ids" {
  description = "(Required) The ID of the routing table to associate with."
  type        = list(string)
  default     = null
}
