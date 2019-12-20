resource "aws_instance" "iaasweek" {
  ami = "ami-00a208c7cdba991ea"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.main.key_name}"
  security_groups = ["${aws_securoty_group.allow_ssh.name}"]
}

output "iaasweek_public_dns" {
  value = "${aws_instance.iaasweek.public_dns}"
}
