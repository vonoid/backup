## machine vars db


variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name machine"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v2"
  description = "platform version"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = 2
#   description = "cores"
# }
#
# variable "vm_db_memory" {
#   type        = number
#   default     = 2
#   description = "mem size"
# }
#
# variable "vm_db_core_fraction" {
#   type        = number
#   default     = 20
#   description = "efficiency"
# }

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "preemptible on"
}

variable "db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "db_vpc_name" {
  type        = string
  default     = "db_develop"
  description = "VPC network & subnet name"
}

variable "zone_vm_db" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}




## machine vars web

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "name image"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name machine"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v2"
  description = "platform version"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "cores"
# }
#
# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "mem size"
# }
#
# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 5
#   description = "efficiency"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "preemptible on"
}

variable "vms_resources" {
  type = map(map(number))
  default = {
    vm_web = {
      cores = 2
      memory = 1
      core_fraction = 5
    },
    vm_db = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map(string)
  default = {
      ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIESQDdtFz+gdsBt2q+wKFNB3HiBZG0/Eftv60B6QErQD nik@sec"
      serial-port-enable = "1"
  }
  description = "VPC network & subnet name"
}