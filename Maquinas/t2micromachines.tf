resource "aws_instance" "iaasweek" {
  ami = "ami-00a208c7cdba991ea"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.main.key_name}"
  security_groups = ["${aws_securoty_group.allow_ssh.name}"]
}


resource "aws_key_pair" "main" {
    key_name = "main"
    public_key = "${file("%USERPROFILE%\\.ssh\\id_rsa.pub")}"
  
}


resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    ingress {
        from_port = 22
        to_port = 22
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


output "iaasweek_public_dns" {
  value = "${aws_instance.iaasweek.public_dns}"
}
