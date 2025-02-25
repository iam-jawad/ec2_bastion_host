provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "BastionHost"
  }
}

variable "aws_region" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "ami_id" {}
variable "instance_type" { default = "t3.micro" }
variable "key_name" {}
variable "allowed_ssh_cidr" { default = ["0.0.0.0/0"] }

