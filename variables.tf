variable "aws_region" {
  description = "AWS region name for the environment"
  type        = string
}
variable "owner" {
  description = "owner tag value"
  type        = string
}
variable "az_count" {
  description = "Number of AZ's for deployment."
  type        = number
}

# VPC variables
variable "vpc_cidr" {
  description = "IPv4 CIDR block"
  type        = string
}
variable "vpc_name" {
  description = "Name tag value of VPC"
  type        = string
}

# Internet gateway variables
variable "igw_name" {
  description = "Name tag value of Internet gateway"
  type        = string
}

# Elastic ip variables
variable "eip_names" {
  description = "Name tag values of Elastic IP's"
  type        = list(string)
}

# NAT gateway variables
variable "nat_names" {
  description = "Name tag values of NAT gateways"
  type        = list(string)
}

# Subnet variables
variable "public_subnet_names" {
  description = "Name tag values of public subnets"
  type        = list(string)
}
variable "wp_subnet_names" {
  description = "Name tag values of Wordpress subnets"
  type        = list(string)
}
variable "rds_subnet_names" {
  description = "Name tag values of RDS subnets"
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "IPv4 CIDR blocks for public subnets"
  type        = list(string)
}
variable "wp_subnet_cidrs" {
  description = "IPv4 CIDR blocks for Wordpress subnets"
  type        = list(string)
}
variable "rds_subnet_cidrs" {
  description = "IPv4 CIDR blocks for RDS subnets"
  type        = list(string)
}

# Route table variables
variable "public_rt_names" {
  description = "Name tag values of public Route tables"
  type        = list(string)
}

variable "private_rt_names" {
  description = "Name tag values of private Route tables"
  type        = list(string)
}

# Target group variables
variable "target_group_name" {
  description = "Name tag value of target group"
  type        = string
}

# Load balancer variables
variable "load_balancer_name" {
  description = "Name tag value of load-balancer"
  type        = string

}

# Security group variables
variable "trusted_ips" {
  description = "IP's allowed to SSH to bastion hosts"
  type        = list(string)
}
variable "secgp_bastion" {
  description = "Security group name"
  type        = string
}
variable "secgp_wordpress" {
  description = "Security group name"
  type        = string
}
variable "secgp_lb" {
  description = "Security group name"
  type        = string
}
variable "secgp_rds" {
  description = "Security group name"
  type        = string
}
variable "secgp_efs" {
  description = "Security group name"
  type        = string
}
# EC2 variable names
variable "bastion_instance_names" {
  description = "List of bastion instance names"
  type        = list(string)
}
variable "wp_instance_names" {
  description = "List of Wordpress instance names"
  type        = list(string)
}

# RDS user variables
variable "rds_root_user" {
  description = "RDS Admin username"
  type        = string
  default     = "academy"
  sensitive   = true
}

variable "rds_root_user_pwd" {
  description = "RDS Admin user password"
  type        = string
  default     = "academy2021"
  sensitive   = true
}

# EFS variables
variable "efs_name" {
  description = "EFS name value"
  type        = string
}

# SSH Public key
variable "AWS_PUB_KEY" {
}