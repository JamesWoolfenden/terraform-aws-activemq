output "configuration" {
  description = "The broker configuration"
  value       = aws_mq_configuration.broker
}

output "broker" {
  description = "The Broker details"
  value       = aws_mq_broker.broker
  sensitive   = true
}

output "mq_username" {
  description = "MQ Username"
  value       = var.username
}

output "mq_password" {
  description = "MQ password"
  value       = var.password
  sensitive   = true
}
