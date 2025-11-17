Terraform AWS Architecture

This project creates a two-tier AWS infrastructure using Terraform.
It includes public EC2 web servers, private RDS MySQL, public/private subnets across two Availability Zones, and properly configured security groups.

📌 Architecture Overview

Terraform deploys:

🏗 NETWORKING

One public and one private subnet in us-east-1a

One public and one private subnet in us-east-1b

Internet Gateway

Public route table with default route to the internet

Private subnets isolated (no internet route)

💻 COMPUTE

Two EC2 instances (one in each public subnet)

Instance names taken from input variables:

instance1_name

instance2_name

🛢 DATABASE

Amazon RDS MySQL instance

Uses both private subnets in its subnet group

Accessible only from the EC2 instances (via security group rules)

🔐 Security Groups

Web SG: Allows port 80 from anywhere

RDS SG: Allows port 3306 only from the Web SG


Files Included
provider.tf — AWS provider and Terraform settings.

variables.tf — Input variables (region, instance names, DB settings).

network.tf — VPC, subnets, Internet Gateway, and public route table.

security.tf — Security groups for web servers and RDS.

compute_and_rds.tf — EC2 instances, AMI lookup, RDS subnet group, and RDS instance.

outputs.tf — Public IPs for EC2 instances and RDS endpoint.
