aws_region = "us-east-1"
owner      = "academy"
az_count   = 2

# VPC variables
vpc_cidr = "192.168.0.0/24"
vpc_name = "academy_vpc"

# Internet gateway variables
igw_name = "academy_igw"

# Elastic ip variables
eip_names = [
  "academy_eip_az1",
  "academy_eip_az2"
]

# NAT gateway variables
nat_names = [
  "academy_nat_az1",
  "academy_nat_az2"
]

# Subnet variables
public_subnet_names = [
  "academy_subnet_public_az1",
  "academy_subnet_public_az2"
]
wp_subnet_names = [
  "academy_subnet_private_wp_az1",
  "academy_subnet_private_wp_az2"
]
rds_subnet_names = [
  "academy_subnet_private_rds_az1",
  "academy_subnet_private_rds_az2"
]
public_subnet_cidrs = [
  "192.168.0.0/28",
  "192.168.0.16/28"
]
wp_subnet_cidrs = [
  "192.168.0.32/28",
  "192.168.0.48/28"
]
rds_subnet_cidrs = [
  "192.168.0.64/28",
  "192.168.0.80/28"
]

# Route table variables
public_rt_names = [
  "academy_route_table_public_igw_az1",
  "academy_route_table_public_igw_az2"
]
private_rt_names = [
  "academy_route_table_private_nat_az1",
  "academy_route_table_private_nat_az2"
]

# Target-group variables
target_group_name = "target-group"

# Load-Balancer variables
load_balancer_name = "load-balancer"

# Segurity group variables
trusted_ips = [
  "0.0.0.0/0"
]
secgp_bastion   = "academy_secgp_bastion"
secgp_wordpress = "academy_secgp_wordpress"
secgp_lb        = "academy_secgp_lb"
secgp_rds       = "academy_secgp_rds"
secgp_efs       = "academy_secgp_efs"

# EC2 variable names
bastion_instance_names = [
  "academy_ec2_bastion_az1",
  "academy_ec2_bastion_az2"
]
wp_instance_names = [
  "academy_ec2_wordpress_az1",
  "academy_ec2_wordpress_az2"
]

# EFS variables
efs_name = "academy_efs"