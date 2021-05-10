package main

empty(value) {
    count(value) == 0
}

no_violations {
    empty(deny)
}

test_blank_input {
    no_violations with input as {}
}

test_fails_with_open_to_world {
    deny["Deny ingress that is open to 0.0.0.0/0"] with input as {"resource": {"module.broker.aws_security_group": {"ingress": {"cidr_blocks": ["0.0.0.0/0"]}}}}
}
