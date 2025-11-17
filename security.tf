# Web server SG: open port 80 from anywhere
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP from anywhere"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "web-sg" }
}

# RDS SG: allow 3306 only from web_sg
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL only from web servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "mysql from web servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "rds-sg" }
}
