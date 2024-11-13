variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_b" {
  type        = string
  default     = "develop_b"
  description = "VPC network & subnet name"
}

variable "vm_db_image" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db" {
  type = string
  default = "db"
}

variable "vm_db_platform" {
  type = string
  default = "standard-v3"
}

# variable "vm_db_cores" {
#   type = number
#   default = 2
# }

# variable "vm_db_memory" {
#   type = number
#   default = 2
# }

# variable "vm_db_fraction" {
#   type = number
#   default = 20
# }


