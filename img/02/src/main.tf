resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform
  resources {
    cores         = var.vms_resources.vm_web.cores
    memory        = var.vms_resources.vm_web.memory
    core_fraction = var.vms_resources.vm_web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.metadata.ssh-keys
    serial-port-enable = var.metadata.serial-port-enable
  }

}


resource "yandex_vpc_subnet" "db_develop" {
  name           = var.db_vpc_name
  zone           = var.zone_vm_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.db_cidr
}

data "yandex_compute_image" "db_ubuntu" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "db_platform" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform
  zone        = var.zone_vm_db
  resources {
    cores         = var.vms_resources.vm_db.cores
    memory        = var.vms_resources.vm_db.memory
    core_fraction = var.vms_resources.vm_db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db_develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.metadata.ssh-keys
    serial-port-enable = var.metadata.serial-port-enable
  }

}
