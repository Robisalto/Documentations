module "instance" {
  source = "../instance"
  count  = 1

  name = "ach-app-${count.index}"
  instance_type = "DEV1-XL"
  priv_net_id = var.priv_net_id
  sec_group_id = var.sec_group_id
}
