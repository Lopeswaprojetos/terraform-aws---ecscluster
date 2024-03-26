variable "central_vpc_name" {
  description = "Nome da VPC"
  default     = "central-vpc"
}

variable "sub_rede_publica_a_name" {
  description = "Nome da sub-rede pública A"
  default     = "sub-rede-publica_a"
}

variable "sub_rede_publica_b_name" {
  description = "Nome da sub-rede pública B"
  default     = "sub-rede-publica_b"
}

variable "internet_gateway_name" {
  description = "Nome do gateway de internet"
  default     = "internet-gateway"
}

variable "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  default     = "meu-cluster-ecs"
}

variable "alb_name" {
  description = "Nome do balanceador de carga"
  default     = "meu-alb"
}

variable "lb_sg_name" {
  description = "Nome do grupo de segurança para o ALB"
  default     = "lb-sg"
}
