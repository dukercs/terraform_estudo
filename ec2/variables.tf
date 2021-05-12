variable "region" {
  description = "Definir qual a regiao"
  default = "sa-east-1"
}

variable "name" {
  description = "Nome da aplicação"
  default = "UbuntuServer01"
}

variable "env" {
  description = "Ambiente"
  default = "prod"
}

variable "ami" {
  description = "Imagem a ser usada - Ubuntu Server 20.04"
  default = "ami-054a31f1b3bf90920"
}

variable "instance_type" {
  description = "Tipo de Instância AWS"
  default = "t2.micro"
}