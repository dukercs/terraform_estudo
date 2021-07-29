resource "aws_instance" "server" {
  count           = var.quantidade
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.keyname
  vpc_security_group_ids = ["${aws_security_group.AcessoSSHTemp.id}"]

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }

}