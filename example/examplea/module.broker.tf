module "broker" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
  vpc_id      = element(tolist(data.aws_vpcs.main.ids), 0)
  mq_broker   = var.mq_broker
  my_config   = var.my_config
  username    = "NotAdmin"
  password    = "TobeEncrypted"
}
