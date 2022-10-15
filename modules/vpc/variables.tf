# vpc/variables

variable "vpc_cidr" {
  description = "IPv4 CIDR block"
  type        = string
  default     = "192.168.0.0/24"
}
variable "vpc_name" {
  description = "Name tag value"
  type        = string
  default     = "academy_vpc"
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}