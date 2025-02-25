# Bastion Host Terraform Configuration

This Terraform configuration creates an EC2 instance to be used as a bastion host in an existing AWS VPC with public subnets.

## Prerequisites

Before running this Terraform configuration, ensure you have the following:

- **Terraform Installed**: [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- **AWS CLI Installed & Configured**: [Install AWS CLI](https://aws.amazon.com/cli/)
- **AWS IAM Credentials** with sufficient permissions to create EC2 instances and security groups.
- **Existing AWS Infrastructure**:
  - A VPC (Virtual Private Cloud)
  - A public subnet in the VPC
  - A key pair for SSH access

## Variables

The configuration uses the following variables:

| Variable          | Description                                         |
|------------------|-------------------------------------------------|
| aws_region       | AWS region where resources will be created       |
| vpc_id          | ID of the existing VPC                          |
| public_subnet_id | ID of the existing public subnet               |
| ami_id          | AMI ID for the bastion host instance           |
| instance_type   | EC2 instance type (default: `t3.micro`)        |
| key_name        | Name of the AWS key pair for SSH access        |
| allowed_ssh_cidr| CIDR block(s) allowed for SSH access (default: `0.0.0.0/0`) |

## Usage

1. **Clone the Repository**
   ```sh
   git clone https://github.com/iam-jawad/ec2_bastion_host.git
   cd ec2_bastion_host
   ```

2. **Initialize Terraform**
   ```sh
   terraform init
   ```

3. **Plan the Deployment**
   ```sh
   terraform plan -var="aws_region=<your-region>" -var="vpc_id=<your-vpc-id>" -var="public_subnet_id=<your-subnet-id>" -var="ami_id=<your-ami-id>" -var="key_name=<your-key-name>"
   ```

4. **Apply the Configuration**
   ```sh
   terraform apply -var="aws_region=<your-region>" -var="vpc_id=<your-vpc-id>" -var="public_subnet_id=<your-subnet-id>" -var="ami_id=<your-ami-id>" -var="key_name=<your-key-name>" -auto-approve
   ```

5. **Access the Bastion Host**
   Retrieve the public IP of the instance:
   ```sh
   terraform output
   ```
   Then, connect via SSH:
   ```sh
   ssh -i <your-key.pem> ec2-user@<bastion-public-ip>
   ```

6. **Destroy the Resources**
   If you want to remove the created resources:
   ```sh
   terraform destroy -auto-approve
   ```

## Notes
- Ensure your key pair (`.pem` file) is available and has the correct permissions (`chmod 400 <your-key.pem>`).
- The security group allows SSH from `0.0.0.0/0` by default; modify this for security best practices.
- Modify the instance type and AMI as needed based on your AWS region and requirements.
