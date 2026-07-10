# holden:ignore:HLD_TF_026
module "broker" {
  source     = "../../"
  subnet_ids = length(data.aws_subnets.private.ids) > 0 ? [element(tolist(data.aws_subnets.private.ids), 0)] : []
  kms_key_id = aws_kms_key.broker.arn
  vpc_id     = local.vpc_id
  mq_broker = {
    name               = "authentic_${lower(random_string.name.result)}"
    engine_type        = "ActiveMQ"
    engine_version     = "5.17.1"
    host_instance_type = "mq.t2.micro"
    deployment_mode    = "SINGLE_INSTANCE"
  }

  # publicly_accessible must be passed as a separate literal boolean (not inside a map)
  publicly_accessible = false
  my_config = {
    description    = "authentic Configuration"
    name           = "authentic_${lower(random_string.name.result)}"
    engine_type    = "ActiveMQ"
    engine_version = "5.17.1"
  }
  username = "NotAdmin"
  password = random_password.password_value.result
  ingress  = [module.ip.cidr]
}

# holden:ignore:HLD_TF_065
module "ip" {
  source = "git::https://github.com/JamesWoolfenden/terraform-http-ip.git?ref=e33037668bc4cf5c25f8962c7e8085df4b61623c" #v0.4.0
}

resource "random_string" "name" {
  length  = 6
  special = false
}


locals {
  vpc_id = length(data.aws_vpcs.main.ids) > 0 ? element(tolist(data.aws_vpcs.main.ids), 0) : var.vpc_id
}
