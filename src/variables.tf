###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
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
  description = "VPC network&subnet name"
}

variable "public_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC+GmAvbNPxQaNyfLqOrUq+Nq/7DYqqy3ByaSFCb2q6W user@WIN-ECB0J3KQ1RA"
}

variable "cores" {
  type = number
  default = 2
}

variable "memory" {
  type = number
  default = 1
}

variable "core_fraction" {
  type = number
  default = 20
}

variable "hdd" {
  type = number
  default = 10
}

variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number }))
  default = [ {
    vm_name = "main"
    cpu = 4
    ram = 2
    disk_volume = 15
    core_fraction = 20
  },
  {
    vm_name = "replica"
    cpu = 2
    ram = 1
    disk_volume = 10
    core_fraction = 20
  }
   ]
}