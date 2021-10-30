//module "mysql_managed" {
//  source    = "./mysql_managed"
//  token     = var.token
//  cloud_id  = var.cloud_id
//  folder_id = var.folder_id
//  zone      = var.zone
//
//}
resource "yandex_mdb_mysql_cluster" "my-mysql" {
  name               = "my-mysql"
  environment        = "PRESTABLE"
  network_id         = yandex_vpc_network.mynet.id
  version            = "8.0"
//  security_group_ids = [yandex_vpc_security_group.mysql-sg.id]

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  database {
    name = "db1"
  }

  user {
    name     = "user1"
    password = "user1user1"
    permission {
      database_name = "db1"
      roles         = ["ALL"]
    }
  }

  host {
    zone      = "ru-central1-c"
    subnet_id = yandex_vpc_subnet.mysubnet.id
  }
}

resource "yandex_vpc_network" "mynet" {
  name = "mynet"
}

//resource "yandex_vpc_security_group" "mysql-sg" {
//  name       = "mysql-sg"
//  network_id = yandex_vpc_network.mynet.id
//
//  ingress {
//    description    = "MySQL"
//    port           = 3306
//    protocol       = "TCP"
//    v4_cidr_blocks = ["0.0.0.0/0"]
//  }
//}

resource "yandex_vpc_subnet" "mysubnet" {
  name           = "mysubnet"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.mynet.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}
