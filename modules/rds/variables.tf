variable "vpc_security_group_ids" {
  description = "security group for rds"
  type        = list(string)
}

variable "subnet_ids" {
  description = "subned id for subnet groups"
  type        = list(string)
}

variable "root_user" {
  description = "Admin username"
  type        = string
}

variable "root_user_pwd" {
  description = "Admin user password"
  type        = string
}