variable "vpc_cidr_block" {
  description = "Range of IPv4 address for the VPC."
  default     = "172.17.0.0/16"
}

variable "az_count" {
  default     = "2"
}

variable "ami" {
  description = "Imagem a ser usada - Ubuntu Server 20.04"
  default     = "ami-054a31f1b3bf90920"
}

variable "keyname" {
  description = "Chave para acesso"
  default     = "chaveGoiania1"
}