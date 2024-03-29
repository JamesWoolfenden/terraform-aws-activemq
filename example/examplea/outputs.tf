output "configuration" {
  value = module.broker.configuration
}
output "broker" {
  value     = module.broker.broker
  sensitive = true
}
output "mq_username" {
  value = module.broker.mq_username
}
output "mq_password" {
  value     = module.broker.mq_password
  sensitive = true
}
