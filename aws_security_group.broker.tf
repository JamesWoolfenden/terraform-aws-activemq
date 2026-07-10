resource "aws_security_group" "broker" {
  description = "broker security: Managed by Terraform"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS outbound"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP outbound"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "DNS outbound"
    from_port   = 53
    protocol    = "udp"
    to_port     = 53
  }

  ingress {
    cidr_blocks = var.ingress
    description = "MQ port"
    from_port   = 61616
    protocol    = "tcp"
    self        = var.mq_broker["deployment_mode"] == "ACTIVE_STANDBY_MULTI_AZ"
    to_port     = 61616
  }


  name_prefix = var.security_group_name
  vpc_id      = var.vpc_id
}
