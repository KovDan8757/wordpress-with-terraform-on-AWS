variable "az_count" {
  description = "Number of subnets to create."
  type        = number
  default     = 2
}

variable "ami" {
  description = "the ami id of the ec2"
  type        = string
  default     = "ami-0747bdcabd34c712a"
}

variable "instance_type" {
  description = "the type of the ec2"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "the type of the ec2"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "the type of the ec2"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "the type of the ec2"
  type        = list(string)
}

variable "subnet_id" {
  description = "the type of the ec2"
  type        = list(string)
}

variable "owner" {
  description = "owner tag value"
  type        = string
  default     = "academy"
}

variable "ec2_names" {
  description = "Name tag values"
  type        = list(string)
  default     = ["ec2_bastion_az1", "ec2_bastion_az2"]
}