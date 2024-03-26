output "vpc_id" {
  value = aws_vpc.central-vpc.id
}

output "public_subnet_a_id" {
  value = aws_subnet.sub-rede-publica_a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.sub-rede-publica_b.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.meu-cluster-ecs.name
}

output "load_balancer_dns_name" {
  value = aws_lb.meu-alb.dns_name
}
