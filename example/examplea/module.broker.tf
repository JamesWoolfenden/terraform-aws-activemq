module "broker" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = length(data.aws_subnets.private.ids) > 0 ? [element(tolist(data.aws_subnets.private.ids), 0)] : []
  kms_key_id  = aws_kms_key.example.arn
  vpc_id      = local.vpc_id
  mq_broker = {
    name                = "authentic_${lower(random_string.name.result)}"
    engine_type         = "ActiveMQ"
    engine_version      = "5.17.1"
    host_instance_type  = "mq.t2.micro"
    deployment_mode     = "SINGLE_INSTANCE"
    publicly_accessible = false
  }
  my_config = {
    description    = "authentic Configuration"
    name           = "authentic_${lower(random_string.name.result)}"
    engine_type    = "ActiveMQ"
    engine_version = "5.17.1"
  }
  username = "NotAdmin"
  password = random_password.password.result
  ingress  = [module.ip.cidr]
}
module "ip" {
  source = "git::https://github.com/JamesWoolfenden/terraform-http-ip.git?ref=5769331633debca683a81a38470083a0abd39049" #response_body fix
}
resource "random_string" "name" {
  length  = 6
  special = false
}


locals {
  vpc_id = length(data.aws_vpcs.main.ids) > 0 ? element(tolist(data.aws_vpcs.main.ids), 0) : var.vpc_id
}
