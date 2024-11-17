resource "yandex_compute_instance" "db" {
  for_each = {for vm in var.each_vm: vm.cpu => vm}
  name        = each.value.vm_name
  hostname    = each.value.vm_name
  platform_id = "standard-v3"

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2404-lts-oslogin.id
      type     = "network-hdd"
      size     = each.value.disk_volume
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
}