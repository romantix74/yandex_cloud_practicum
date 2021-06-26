terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}



resource "yandex_compute_instance" "vm-1" {
  metadata = {
    user-data = "${file("metadata.txt")}"
  }
  name        = "test1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.test_image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test_subnet.id
  }
}