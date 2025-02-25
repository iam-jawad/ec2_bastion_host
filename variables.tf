variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the existing public subnet"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the bastion host instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block(s) allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
