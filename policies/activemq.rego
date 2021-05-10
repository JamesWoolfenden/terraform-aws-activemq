package main

has_field(obj, field) {
    obj[field]
}

deny[msg] {
    broker := input.resource.aws_mq_broker
    broker.name == ""
    msg := "MQ Broker is not named"
}

deny[msg] {
    rule := input.module.broker.aws_security_group[name]
    contains(rule.ingress[_].cidr_blocks[_], "0.0.0.0/0")
    msg := sprintf("Security group `%v` defines a fully open ingress", [name])
}

deny[msg] {
    rule := input.module
    msg := "Broken"
}
