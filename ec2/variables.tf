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

variable "keyname" {
  description = "Chave para acesso"
  default = "chaveTerra1"
}

variable "securitygroup" {
  description = "Grupo de controle de acesso"
  default = "AcessoSSHTemp"
}

data "http" "meuip" {
  url = "http://ipv4.icanhazip.com"
}