variable "subnet_ids" {
  description = "subned id for subnet groups"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "security group for rds"
  type        = list(string)
}

variable "az_count" {
  description = "Number of mount-targets to create."
  type        = number
  default     = 2
}