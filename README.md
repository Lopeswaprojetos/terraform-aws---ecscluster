
## Terraform AWS ECS Cluster

Este projeto usa Terraform para provisionar uma infraestrutura básica na AWS para um ECS Cluster. Ele cria uma Virtual Private Cloud (VPC) com duas subnets públicas, um Internet Gateway, um ECS Cluster e um Application Load Balancer (ALB), juntamente com um grupo de segurança para o ALB.

##Pré-requisitos
Terraform instalado localmente.
Credenciais válidas da AWS configuradas.

##Como usar
Clone este repositório: git clone <URL_DO_REPOSITÓRIO>
Navegue até o diretório clonado: cd terraform-aws-ecscluster
Inicialize o diretório do Terraform:terraform init
Visualize as alterações que serão feitas:terraform plan
Aplique as alterações:terraform apply
Após a conclusão da implantação, você pode encontrar as informações necessárias para acessar sua infraestrutura, como o DNS do ALB e outros detalhes relevantes, no console da AWS ou usando comandos do Terraform.

##Personalização
Você pode personalizar esta infraestrutura de acordo com suas necessidades, ajustando os parâmetros no arquivo variables.tf.

##"Limpeza"
Após o uso, é recomendável destruir a infraestrutura para evitar custos indesejados: terraform destroy

##Contribuindo
Contribuições são bem-vindas! Sinta-se à vontade para abrir uma [issue](link para issue tracker) ou enviar um [pull request](link para pull requests) com melhorias ou novos recursos.
