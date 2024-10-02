output "YC_VM" {
  value = [
    { vm_web = ["Name Machine: ${yandex_compute_instance.platform.name}","Public ip: ${yandex_compute_instance.platform.network_interface[0].nat_ip_address}","FQDN: ${yandex_compute_instance.platform.fqdn}"] },
    { vm_db = ["Name Machine: ${yandex_compute_instance.db_platform.name}","Public ip: ${yandex_compute_instance.db_platform.network_interface[0].nat_ip_address}","FQDN: ${yandex_compute_instance.db_platform.fqdn}"] }
  ]
}