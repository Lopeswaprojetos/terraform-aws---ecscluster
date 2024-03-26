provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "central-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub-rede-publica_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "sub-rede-publica_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc_attachment" "anexo-vpc-internet-gateway" {
  vpc_id             = aws_vpc.main.id
  internet_gateway_id = aws_internet_gateway.gw.id
}

resource "aws_ecs_cluster" "meu-cluster-ecs" {
  name = "meu-cluster-ecs"
}

resource "aws_lb" "meu-alb" {
  name               = "meu-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}

resource "aws_security_group" "lb-sg" {
  name        = "lb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
