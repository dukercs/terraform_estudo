resource "aws_network_interface" "k8s_master" {
  subnet_id     =   "${aws_subnet.private.id}"
  private_ips   =   ["172.17.0.101"]
}


resource "aws_network_interface" "k8s_node1" {
  subnet_id     =   "${aws_subnet.private.id}"
  private_ips   =   ["172.17.0.111"]
}

resource "aws_network_interface" "k8s_node2" {
  subnet_id     =   "${aws_subnet.private.id}"
  private_ips   =   ["172.17.0.112"]
}
