
package main

has_field(obj, field) {
    obj[field]
}


deny[msg] {
    broker := input.resource.aws_mq_broker
    broker.name == ""
    msg := sprintf("MQ Broker is not named")
}
