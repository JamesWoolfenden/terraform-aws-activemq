output "configuration" {
  description = "The broker configuration"
  value       = aws_mq_configuration.broker
}

output "broker" {
  description = "The Broker details"
  value       = aws_mq_broker.broker
}

output "mq_username" {
  description = "MQ Username"
  value       = var.mq_username
}

output "mq_password" {
  description = "MQ password"
  value       = random_password.password.result
}
