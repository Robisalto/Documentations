module "instance" {
  source = "../instance"
  count  = 3

  name = "ach-es-${count.index}"
  instance_type = "DEV1-S"
  priv_net_id = var.priv_net_id
  sec_group_id = var.sec_group_id
}
