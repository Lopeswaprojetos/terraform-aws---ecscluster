variable "region" {
  description = "A região da AWS onde os recursos serão provisionados."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "O bloco CIDR para a VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_a_cidr_block" {
  description = "O bloco CIDR para a sub-rede pública A."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr_block" {
  description = "O bloco CIDR para a sub-rede pública B."
  type        = string
  default     = "10.0.2.0/24"
}

variable "ecs_cluster_name" {
  description = "O nome do cluster ECS."
  type        = string
  default     = "my-ecs-cluster"
}

variable "lb_name" {
  description = "O nome do Application Load Balancer (ALB)."
  type        = string
  default     = "my-alb"
}

variable "lb_ingress_cidr_blocks" {
  description = "Os blocos CIDR permitidos para tráfego de entrada no ALB."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
