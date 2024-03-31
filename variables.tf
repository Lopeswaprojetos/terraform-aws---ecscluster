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