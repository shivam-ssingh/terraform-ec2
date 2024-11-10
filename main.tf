provider "aws" {
  # profile = "default" https://stackoverflow.com/questions/75740175/error-configuring-terraform-aws-provider-failed-to-get-shared-config-profile
  region = "eu-north-1"
}


# VPC
resource "aws_vpc" "project_vpc" {
  cidr_block = var.vpc_cider
  tags = {
    Name = var.vpc_name
  }
}


# subnet
resource "aws_subnet" "project_subnet" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = var.subnet_name
  }
}

# Create route to internet
resource "aws_internet_gateway" "project_ig" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = var.igw_name
  }
}


# Create a Route Table with gateway
resource "aws_route_table" "project_route" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_ig.id
  }

  tags = {
    Name = var.igw_name
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "project_public_assoc" {
  subnet_id      = aws_subnet.project_subnet.id
  route_table_id = aws_route_table.project_route.id
}

# Create a Security Group
resource "aws_security_group" "project_sg" {
  name        = "HTTP"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 5100
    to_port     = 5100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 Instance
resource "aws_instance" "project_ec2" {
  ami           = var.ec2_ami  
  instance_type =  "t3.micro"
  
  subnet_id     = aws_subnet.project_subnet.id
  vpc_security_group_ids = [aws_security_group.project_sg.id]
  associate_public_ip_address = true
  
  key_name = "AnsiblePEM"
  
  tags = {
    Name = var.ec2_name
  }
}