resource "aws_instance" "k8s_master" {
 instance_type   = "t2.micro"
 ami             = "ami-04b9e92b5572fa0d1"
 key_name        = aws_key_pair.main.key_name
 security_groups = ["${aws_security_group.allow_ssh.name}"]
 network_interface {
   network_interface_id  = aws_network_interface.k8s_master.id
   device_index          = 0
   delete_on_termination = "true"
 }
 tags = {
   Name = "k8s_master"
 }
}
output "k8s_master_public_dns" {
  value = aws_instance.k8s_master.public_dns
}


resource "aws_instance" "k8s_node1" {
 instance_type   = "t2.micro"
 ami             = "ami-04b9e92b5572fa0d1"
 key_name        = aws_key_pair.main.key_name
 security_groups = ["${aws_security_group.allow_ssh.name}"]
  network_interface {
   network_interface_id  = aws_network_interface.k8s_node1.id
   device_index          = 0
   delete_on_termination = "true"
 }
 tags = {
   Name = "k8s_node1"
 }
}

output "k8s_node1_public_dns" {
  value = aws_instance.k8s_node1.public_dns
}


resource "aws_instance" "k8s_node2" {
 instance_type   = "t2.micro"
 ami             = "ami-04b9e92b5572fa0d1"
 key_name        = aws_key_pair.main.key_name
 security_groups = ["${aws_security_group.allow_ssh.name}"]
 network_interface {
   network_interface_id  = aws_network_interface.k8s_node2.id
   device_index          = 0
   delete_on_termination = "true"
 }
 tags = {
   Name = "k8s_node2"
 }
}
output "k8s_node2_public_dns" {
  value = aws_instance.k8s_node2.public_dns
}

