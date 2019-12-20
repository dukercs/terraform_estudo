resource "aws_network_interface" "k8s_master" {
  subnet_id     =   element(aws_subnet.private.*.id, 0)
  private_ips   =   ["172.17.0.101"]
}


resource "aws_network_interface" "k8s_node1" {
  subnet_id     =   element(aws_subnet.private.*.id, 0)
  private_ips   =   ["172.17.0.111", ]
}

resource "aws_network_interface" "k8s_node2" {
  subnet_id     =   element(aws_subnet.private.*.id, 0)
  private_ips   =   ["172.17.0.112"]
}
