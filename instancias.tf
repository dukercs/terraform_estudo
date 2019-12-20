resource "aws_instance" "k8s_master" {
 instance_type   = "t2.micro"
 ami             = "ami-04b9e92b5572fa0d1"
 key_name        = "${aws_key_pair.main.key_name}"
 security_groups = ["${aws_securoty_group.allow_ssh.name}"]

 network_interface {
   network_interface_id  = "${aws_network_interface.k8s_master.id}"
   device_index          = 0
 }
 tags = {
   Name = "k8s_master"
 }
}


resource "aws_instance" "k8s_node1" {
 instance_type   = "t2.micro"
 ami             = "ami-04b9e92b5572fa0d1"
 key_name        = "${aws_key_pair.main.key_name}"
 security_groups = ["${aws_securoty_group.allow_ssh.name}"]
  network_interface {
   network_interface_id  = "${aws_network_interface.k8s_node1.id}"
   device_index          = 0
 }
 tags = {
   Name = "k8s_node1"
 }
}

resource "aws_instance" "k8s_node2" {
 instance_type   = "t2.micro"
 ami             = "ami-04b9e92b5572fa0d1"
 key_name        = "${aws_key_pair.main.key_name}"
 security_groups = ["${aws_securoty_group.allow_ssh.name}"]

 network_interface {
   network_interface_id  = "${aws_network_interface.k8s_node2.id}"
   device_index          = 0
 }
 tags = {
   Name = "k8s_node2"
 }
}


output "iaasweek_public_dns" {
  value = "${aws_instance.iaasweek.public_dns}"
}
