output "instanceID" {
  description = "EC2 instance output"
  value = aws_instance.project_ec2.id
}

output "instancePublicIp" {
  description = "Public IP of the Instance"
  value = aws_instance.project_ec2.public_ip
}