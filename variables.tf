variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "az1_suffix" {
  type    = string
  default = "a"
}

variable "az2_suffix" {
  type    = string
  default = "b"
}

variable "instance1_name" {
  type        = string
  description = "Name tag for EC2 instance in AZ1 public subnet"
  default     = "web-1"
}

variable "instance2_name" {
  type        = string
  description = "Name tag for EC2 instance in AZ2 public subnet"
  default     = "web-2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
  description = "Provide a secure DB password (do not commit in repo)."
  default   = ""
}
