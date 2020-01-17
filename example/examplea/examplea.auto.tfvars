common_tags = {
  name = "Pizza"
}

my_config = {
  description    = "authentic Configuration"
  name           = "authentic"
  engine_type    = "ActiveMQ"
  engine_version = "5.15.0"
}

mq_broker = {
  name               = "authentic"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t2.micro"
}
