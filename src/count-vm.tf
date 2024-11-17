resource "yandex_compute_instance" "web" {
  count = 2

  name        = "web-${count.index+1}"
  hostname    = "web-${count.index+1}"
  platform_id = "standard-v3"

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2404-lts-oslogin.id
      type     = "network-hdd"
      size     = var.hdd
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
     security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }

  depends_on = [ yandex_compute_instance.db ]
}