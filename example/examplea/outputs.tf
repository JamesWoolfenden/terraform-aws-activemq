output "configuration" {
  value       = module.broker.configuration
  description = "The configuration details for the ActiveMQ broker, including its ID and latest revision."
}

output "broker" {
  value       = module.broker.broker
  sensitive   = true
  description = "The details of the ActiveMQ broker, including its name, engine type, version, and other configuration settings."
}

output "mq_username" {
  value       = module.broker.mq_username
  description = "The username for the ActiveMQ user. This is sensitive and should be handled securely."
}

output "mq_password" {
  value       = module.broker.mq_password
  sensitive   = true
  description = "The password for the ActiveMQ user. This is sensitive and should be handled securely."
}
