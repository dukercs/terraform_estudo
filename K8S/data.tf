data "aws_availability_zones" "available" {}

data "http" "meuip" {
  url         = "http://ipv4.icanhazip.com"
}