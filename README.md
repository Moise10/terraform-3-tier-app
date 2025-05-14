# Terraform 3 tier app

## architecture

![terraform Graph](architecture.svg) 


A production-ready 3-tier AWS infrastructure deployed with Terraform, featuring:
- **VPC Networking** with public/private subnets
- **Auto-Scaling Web Tier** behind Application Load Balancer
- **Managed RDS Database** in private subnets
- **Security Best Practices** (least privilege IAM, security groups)

## Architecture Diagram
![3-Tier Architecture](architecture.png)

## Features

✅ **Infrastructure as Code**  
- Complete AWS environment defined in Terraform (VPC, EC2, RDS, ALB)  
- Modular design for reusability  

✅ **Operational Excellence**  
- Auto-scaling group (2-4 EC2 instances)  
- CloudWatch monitoring alarms  
- Zero-downtime deployments  

✅ **Security**  
- Database isolated in private subnets  
- Encrypted RDS storage  
- Restricted security group rules  

✅ **Cost Optimized**  
- Spot instance support (savings up to 70%)



## Prerequisites

- Terraform >= 1.3.0
- AWS account with IAM permissions
- AWS CLI configured (`aws configure`)


### Deployment

```bash
terraform init
terraform plan
terraform apply

