# eip/variables

variable "az_count" {
  description = "Number of EIP's to create."
  type        = number
  default     = 2
}
variable "eip_names" {
  description = "Name tag values"
  type        = list(string)
  default     = ["academy-eip_az1", "academy-eip_az2"]
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}
