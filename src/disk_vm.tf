resource "yandex_compute_disk" "disks" {
  count = 3
  name       = "disk-${count.index+1}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 1
}

resource "yandex_compute_instance" "storage" {
  count = 1

  name        = "storage-${count.index+1}"
  hostname    = "storage-${count.index+1}"
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

  dynamic "secondary_disk" {
      for_each = toset(yandex_compute_disk.disks)
      content {
        disk_id = secondary_disk.value.id
      }
    }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  
  depends_on = [ yandex_compute_disk.disks ]

}