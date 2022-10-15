provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_key_pair" "key-dev-master" {
  key_name   = "master2"
  public_key = var.AWS_PUB_KEY
}

# Create VPC
module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  owner    = var.owner
}

# Create internet gateway
module "igw" {
  source   = "./modules/igw"
  igw_name = var.igw_name
  vpc_id   = module.vpc.vpc_id
  owner    = var.owner
}

# Create elastic ips
module "eip" {
  source    = "./modules/eip"
  eip_names = var.eip_names
  az_count  = var.az_count
  owner     = var.owner
}

# Create NAT gateways
module "nat" {
  source     = "./modules/nat"
  depends_on = [module.igw, module.eip]
  nat_names  = var.nat_names
  az_count   = var.az_count
  eip_ids    = module.eip.eip_ids
  subnet_ids = module.public_subnets.subnet_ids
  owner      = var.owner
}

# Create subnets
module "public_subnets" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.vpc_id
  az_count = var.az_count
  az_list  = data.aws_availability_zones.available
  owner    = var.owner

  subnet_names = var.public_subnet_names
  subnet_cidrs = var.public_subnet_cidrs
  is_public    = true
}

module "wp_subnets" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.vpc_id
  az_count = var.az_count
  az_list  = data.aws_availability_zones.available
  owner    = var.owner

  subnet_names = var.wp_subnet_names
  subnet_cidrs = var.wp_subnet_cidrs
  is_public    = false
}

module "rds_subnets" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.vpc_id
  az_count = var.az_count
  az_list  = data.aws_availability_zones.available
  owner    = var.owner

  subnet_cidrs = var.rds_subnet_cidrs
  subnet_names = var.rds_subnet_names
  is_public    = false
}

# Create route tables
module "public_route_tables" {
  source   = "./modules/route_tables"
  az_count = var.az_count
  vpc_id   = module.vpc.vpc_id
  owner    = var.owner

  rt_names        = var.public_rt_names
  gateway_id      = module.igw.igw_id
  nat_gateway_ids = null
}

module "private_route_tables" {
  source   = "./modules/route_tables"
  az_count = var.az_count
  vpc_id   = module.vpc.vpc_id
  owner    = var.owner

  rt_names        = var.private_rt_names
  gateway_id      = null
  nat_gateway_ids = module.nat.nat_id
}

# Create route table associations
module "public_subnets_rt_association" {
  source   = "./modules/route_table_association"
  az_count = var.az_count

  subnet_ids = module.public_subnets.subnet_ids
  rt_ids     = module.public_route_tables.rt_ids
}

module "wp_subnets_rt_association" {
  source   = "./modules/route_table_association"
  az_count = var.az_count

  subnet_ids = module.wp_subnets.subnet_ids
  rt_ids     = module.private_route_tables.rt_ids
}

module "rds_subnets_rt_association" {
  source   = "./modules/route_table_association"
  az_count = var.az_count

  subnet_ids = module.rds_subnets.subnet_ids
  rt_ids     = module.private_route_tables.rt_ids
}

# Create load balancer
module "target_group" {
  source = "./modules/target_group"
  depends_on = [
    module.ec2_wp
  ]
  target_group_name = var.target_group_name
  vpc_id            = module.vpc.vpc_id
  owner             = var.owner
  ec2_ids           = module.ec2_wp.ec2_wp_ids
}

module "load_balancer" {
  source             = "./modules/load_balancer"
  load_balancer_name = var.load_balancer_name
  subnet_ids         = module.public_subnets.subnet_ids
  secgp_lb           = [module.secgp_lb.secgp_id]
  target_group_arn   = module.target_group.target_group_arn
  #target_group_id     = module.target_group.target_group_id
  owner = var.owner
}

# Create security groups
module "secgp_bastion" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  owner  = var.owner

  secgp_name = var.secgp_bastion
  rules = [{
    description     = "SSH from trusted IPs",
    port            = 22,
    cidr_blocks     = var.trusted_ips,
    security_groups = null
  }]
}

module "secgp_lb" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  owner  = var.owner

  secgp_name = var.secgp_lb
  rules = [{
    description     = "HTTP from anywhere",
    port            = 80,
    cidr_blocks     = ["0.0.0.0/0"],
    security_groups = null
    }, {
    description     = "HTTPS from anywhere",
    port            = 443,
    cidr_blocks     = ["0.0.0.0/0"],
    security_groups = null
  }]
}

module "secgp_wordpress" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  owner  = var.owner

  secgp_name = var.secgp_wordpress
  rules = [{
    description     = "HTTP from load balancer",
    port            = 80,
    cidr_blocks     = null,
    security_groups = [module.secgp_lb.secgp_id]
    }, {
    description     = "HTTPS from load balancer",
    port            = 443,
    cidr_blocks     = null,
    security_groups = [module.secgp_lb.secgp_id]
    }, {
    description     = "SSH from bastion",
    port            = 22,
    cidr_blocks     = null,
    security_groups = [module.secgp_bastion.secgp_id]
  }]
}

module "secgp_efs" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  owner  = var.owner

  secgp_name = var.secgp_efs
  rules = [{
    description     = "EFS from wordpress",
    port            = 2049,
    cidr_blocks     = null,
    security_groups = [module.secgp_wordpress.secgp_id]
  }]
}

module "secgp_rds" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  owner  = var.owner

  secgp_name = var.secgp_rds
  rules = [{
    description     = "MySQL from Wordpress",
    port            = 3306,
    cidr_blocks     = null,
    security_groups = [module.secgp_wordpress.secgp_id]
  }]
}

# Create EC2 instances
module "ec2_bastion" {
  source   = "./modules/ec2_bastion"
  az_count = var.az_count

  associate_public_ip_address = true
  key_name                    = aws_key_pair.key-dev-master.key_name
  vpc_security_group_ids      = [module.secgp_bastion.secgp_id]
  subnet_id                   = module.public_subnets.subnet_ids
  ec2_names                   = var.bastion_instance_names
}

module "ec2_wp" {
  source   = "./modules/ec2_wp"
  az_count = var.az_count
  depends_on = [
    module.create_rds,
    module.create_efs
  ]
  vpc_security_group_ids = [module.secgp_wordpress.secgp_id]
  key_name               = aws_key_pair.key-dev-master.key_name
  subnet_id              = module.wp_subnets.subnet_ids
  ec2_names              = var.wp_instance_names
  rds_address            = module.create_rds.rds_address
  efs_address            = module.create_efs.efs_address
}

// Create RDS Database
module "create_rds" {
  source = "./modules/rds"

  vpc_security_group_ids = [module.secgp_rds.secgp_id]
  subnet_ids             = module.rds_subnets.subnet_ids
  root_user              = var.rds_root_user
  root_user_pwd          = var.rds_root_user_pwd
}

//Create EFS and mount point
module "create_efs" {
  source = "./modules/efs"

  az_count               = var.az_count
  vpc_security_group_ids = [module.secgp_efs.secgp_id]
  subnet_ids             = module.wp_subnets.subnet_ids
}

