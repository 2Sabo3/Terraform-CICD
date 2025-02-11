resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "Terraform-VPC"
    }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "Terraform-Subnet"
  }
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.vpc.id
  name = "Server-Allowed-Ports"
  description = "Allowed Ports"

  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.sg_allowed_ip]
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.sg_allowed_ip]
  }
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "terraform"
  }
}

resource "aws_internet_gateway_attachment" "igwa" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.vpc.id
}
