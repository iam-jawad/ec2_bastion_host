output "bastion_public_ip" {
  description = "The public IP of the bastion host"
  value       = aws_instance.bastion.public_ip
}
