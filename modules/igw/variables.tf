# igw/variables

variable "igw_name" {
  description = "Name tag value"
  type        = string
  default     = "academy-igw"
}
variable "vpc_id" {
  description = "(Required) The vpc id to create in"
  type        = string
  default     = null
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}