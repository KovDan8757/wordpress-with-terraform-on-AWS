# subnet/variables

variable "az_count" {
  description = "Number of subnets to create."
  type        = number
  default     = 2
}
variable "vpc_id" {
  description = "(Required) The vpc id to create in"
  type        = string
  default     = null
}
variable "az_list" {
  description = "(Required) List of available AZ's"
  /*
  type = list(object({
    names = string
  }))
  */
  default = null
}
variable "subnet_cidrs" {
  description = "IPv4 CIDR block"
  type        = list(string)
  default     = ["192.168.0.0/28", "192.168.0.16/28"]
}
variable "subnet_names" {
  description = "Name tag values"
  type        = list(string)
  default     = ["academy_nat_az1", "academy_nat_az2"]
}
variable "is_public" {
  description = "Assign public IP on launch"
  type        = bool
  default     = false
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}