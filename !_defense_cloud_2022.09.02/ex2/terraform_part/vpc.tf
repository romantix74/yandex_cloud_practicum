# ===============
# VPC Resources
# ===============

resource "yandex_vpc_network" "network-remote-office" {
  name      = var.vpc_name
  folder_id = yandex_resourcemanager_folder.for_ipsec_folder.id
}

resource "yandex_vpc_subnet" "remotesubnet" {
  count          = length(var.net_cidr)
  name           = var.net_cidr[count.index].name
  zone           = var.net_cidr[count.index].zone
  v4_cidr_blocks = [var.net_cidr[count.index].prefix]
  network_id     = yandex_vpc_network.network-remote-office.id
  folder_id = yandex_resourcemanager_folder.for_ipsec_folder.id
}