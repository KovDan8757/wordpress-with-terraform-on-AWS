# security_groups/variables

variable "secgp_name" {
  description = "Security group name"
  type        = string
  default     = "academy_secgp"
}
variable "vpc_id" {
  description = "(Required) The vpc id to create in"
  type        = string
  default     = null
}
variable "rules" {
  description = "Inbound rules to create"
  type        = list(any)
  /*rules = [{
      description     = <description>
      port            = <port>,
      cidr_blocks     = <ip range>,
      security_groups = <security group id>
    }]  */
  default = null
}
variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}