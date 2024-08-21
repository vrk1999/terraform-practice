output "public-ip" {
  value       = aws_instance.test-ec2.public_ip
  description = "EC2 public ip"
}

output "private-ip" {
  value     = aws_instance.test-ec2.private_ip
  sensitive = true
}