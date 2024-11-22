terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}


#создаем облачную сеть
resource "yandex_vpc_network" "network" {
  name = "network-${var.env_name}"
}

#создаем подсеть
resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet-${var.env_name}"
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

