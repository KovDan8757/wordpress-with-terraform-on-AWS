**0. Clean code policy or you die (and this is not a joke you bastard)**
1. Folder and file names just lower_case
2. AWS name tags:
    - academy_vpc
    - academy_igw
    - academy_subnet_private_wp_az
    - academy_subnet_private_rds_az
    - academy_subnet_public_az
    - academy_subnet_group_rds
    - academy_nat_az
    - academy_route_table_public_igw_az
    - academy_route_table_private_nat_az
    - academy_secgp_bastion
    - academy_secgp_wodpress
    - academy_secgp_rds
    - academy_secgp_lb
    - academy_rds_mysql_az
    - academy_efs
    - academy_ec2_bastion_az
    - academy_ec2_wordpress_az
    - academy_target_group
    - academy_load_balancer

3. Create RDS DB with variables in .tfvars:
    - rds_root_user = username
    - rds_root_pwd = so_secret_password 

4. Wordpress install with variables in .tfvars:
    - wp_title = titlename
    - wp_user = username
    - wp_pwd = so_secret_password