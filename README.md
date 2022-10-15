# Terraform IaC with AWS


# Code convention

 - Naming convention and tagging
 - All resources (if applicable) has to follow the given naming convention
 - ResourceType-Environment-Name<Number>
 - Example:
        - First EC2 host in Develop environment using as a bastion host
            - ec2-dev-bastion1
        - Security group in Develop environment attached to bastion hosts
            - secg-dev-bastion
    - All resources (if applicable) has to have proper tagging for audit and cost allocation reason
        - Mandatory tags:  owner
        - Optional tags
        - cost center

