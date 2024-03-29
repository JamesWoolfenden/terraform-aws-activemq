resource "aws_mq_broker" "broker" {
  broker_name = var.mq_broker["name"]

  auto_minor_version_upgrade = true

  configuration {
    id       = aws_mq_configuration.broker.id
    revision = aws_mq_configuration.broker.latest_revision
  }

  engine_type         = var.mq_broker["engine_type"]
  engine_version      = var.mq_broker["engine_version"]
  host_instance_type  = var.mq_broker["host_instance_type"]
  deployment_mode     = var.mq_broker["deployment_mode"]
  publicly_accessible = var.mq_broker["publicly_accessible"]
  security_groups     = [aws_security_group.broker.id]

  user {
    username = var.username
    password = var.password
  }

  maintenance_window_start_time {
    day_of_week = var.maintenance_window_start_time["day_of_week"]
    time_of_day = var.maintenance_window_start_time["time_of_day"]
    time_zone   = var.maintenance_window_start_time["time_zone"]
  }

  encryption_options {
    kms_key_id        = var.kms_key_id
    use_aws_owned_key = false
  }

  logs {
    general = true
    audit   = true
  }

  subnet_ids = var.subnet_ids
  tags       = var.common_tags
}
