resource "yandex_vpc_security_group" "test-sg" {
  name        = "Default"
  description = "Description for security group"
  network_id  = yandex_vpc_network.network-remote-office.id
  folder_id = yandex_resourcemanager_folder.for_ipsec_folder.id

  ingress {
    protocol    = "tcp"
    description = "ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 22
  }
  ingress {
    protocol    = "udp"
    description = "ipsec"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 500
  }

  ingress {
    protocol    = "udp"
    description = "ipsec"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 4500
  }

  egress {
    protocol    = "ANY"
    description = "allow any egress"
    v4_cidr_blocks = ["0.0.0.0/0"]
    #    from_port      = 8090
    #    to_port        = 8099
  }
}