output "configuration" {
  value = aws_mq_configuration.broker
}

output "broker" {
  value = aws_mq_broker.broker
}

output "mq_username" {
  value = var.mq_username
}

output "mq_password" {
  value = random_password.password.result
}
