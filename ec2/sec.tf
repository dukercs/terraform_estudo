# criar chave
resource "aws_key_pair" "main" {
    key_name = var.keyname
    public_key = file("~/.ssh/aws.pub")
 
}


resource "aws_security_group" "AcessoSSHTemp" {
    name = "AcessoSSHTemp"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${chomp(data.http.meuip.body)}/32"]
    }
    ingress {
        from_port = 7463
        to_port = 7463
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}