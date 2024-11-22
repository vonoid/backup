module "vpc" {
  source = "./vpc_module"
  env_name = "develop"
  zone = "ru-central1-a"
  v4_cidr_blocks = ["10.0.0.0/24"]
}


module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "vm" 
  network_id     = module.vpc.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc.subnet_id]
  instance_name  = "marketingvm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "i.ivanov",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered 
    serial-port-enable = 1
  }

}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "vm" 
  network_id     = module.vpc.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc.subnet_id]
  instance_name  = "analyticsvm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "i.ivanov",
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}


#Пример передачи cloud-config в ВМ для демонстрации №3
data template_file "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key     = var.public_key
  }
}

