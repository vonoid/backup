###cloud vars


variable "cloud_id" {
  type        = string
  default = "b1gsvfdtubarjbp5hrcg"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1gbq0odhebh8pnqgnm9"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_image" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_netology" {
  type = string
  default = "netology"
}

variable "vm_develop" {
  type = string
  default = "develop"
}

variable "vm_platform" {
  type = string
  default = "platform"
}

variable "vm_web" {
  type = string
  default = "web"
}

variable "vm_web_platform" {
  type = string
  default = "standard-v3"
}

# variable "vm_web_cores" {
#   type = number
#   default = 2
# }

# variable "vm_web_memory" {
#   type = number
#   default = 1
# }

# variable "vm_web_fraction" {
#   type = number
#   default = 20
# }
variable "vms_config" {
  type = map(object({
    cores = number
    memory  = number
    core_fraction = number
  }))
  default = {
    "web" = {
      cores = 2
      memory = 1
      core_fraction = 20
    },
    "db" = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "vms_ssh" {
  type = map(object({
      serial-port-enable = number
      ssh-keys           = string
  }))
  default = {
      ssh = {
        serial-port-enable = 1
        ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC+GmAvbNPxQaNyfLqOrUq+Nq/7DYqqy3ByaSFCb2q6W user@WIN-ECB0J3KQ1RA"
      }
    }
}



###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC+GmAvbNPxQaNyfLqOrUq+Nq/7DYqqy3ByaSFCb2q6W user@WIN-ECB0J3KQ1RA"
#   description = "ssh-keygen -t ed25519"
# }
