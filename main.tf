terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "central-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub-rede-publica_a" {
  vpc_id            = aws_vpc.central-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "sub-rede-publica_b" {
  vpc_id            = aws_vpc.central-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.central-vpc.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.central-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
}

resource "aws_route_table_association" "public_subnet_a_association" {
  subnet_id      = aws_subnet.sub-rede-publica_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_b_association" {
  subnet_id      = aws_subnet.sub-rede-publica_b.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_ecs_cluster" "meu-cluster-ecs" {
  name = var.ecs_cluster_name
}

resource "aws_lb" "meu-alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_subnet.sub-rede-publica_a.id, aws_subnet.sub-rede-publica_b.id]
}

resource "aws_security_group" "lb-sg" {
  name        = var.lb_sg_name
  description = "Security group for ALB"
  vpc_id      = aws_vpc.central-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
