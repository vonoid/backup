resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.vpc_name_b
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}
resource "yandex_compute_instance" "platform_a" {
  name        = local.name_web
  platform_id = var.vm_web_platform
  resources {
    cores         = var.vms_config.web.cores
    memory        = var.vms_config.web.memory
    core_fraction = var.vms_config.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_ssh.ssh.serial-port-enable
    ssh-keys           = var.vms_ssh.ssh.ssh-keys
  }

}


resource "yandex_compute_instance" "platform_b" {
  name        = local.name_db
  platform_id = var.vm_db_platform
  zone = var.default_zone_b
  resources {
    cores         = var.vms_config.db.cores
    memory        = var.vms_config.db.memory
    core_fraction = var.vms_config.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_ssh.ssh.serial-port-enable
    ssh-keys           = var.vms_ssh.ssh.ssh-keys
  }

}
