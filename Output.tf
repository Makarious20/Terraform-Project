output "web1_public_ip" {
  value       = aws_instance.web1.public_ip
  description = "Public IP of web1"
}

output "web2_public_ip" {
  value       = aws_instance.web2.public_ip
  description = "Public IP of web2"
}

output "rds_endpoint" {
  value       = aws_db_instance.mysql.address
  description = "RDS MySQL endpoint"
}
