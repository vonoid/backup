locals {
  name1 = "netology"
  name2 = "develop"
  name3 = "platform"
  name4 = "db"
  name5 = "web"
  vm_db_name = "${local.name1} - ${local.name2} - ${local.name3} - ${local.name4}"
  vm_web_name = "${local.name1} - ${local.name2} - ${local.name3} - ${local.name5}"
}