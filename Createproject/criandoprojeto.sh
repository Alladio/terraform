#criando um projeto
terraform init

#Criando o plano e revisando
terraform plan

#aplicando as mudanças
terraform apply

#destruindo a infra
#Vai pegar o arquivo terraform.tfstate como base para excluir os recursos
terraform destroy

#aplicando as mudanças + variavel
terraform apply -var="aws_region=sa=east-1"
