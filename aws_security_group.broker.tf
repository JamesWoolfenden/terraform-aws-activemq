resource "aws_security_group" "broker" {
  description = "Managed by Terraform"
  egress {
    cidr_blocks = ["0.0.0.0/0", ]
    description = "Outbound"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "MQ port"
    from_port   = 61616
    protocol    = "tcp"
    self        = false
    to_port     = 61616
  }


  name   = "Broker"
  vpc_id = var.vpc_id
  tags   = var.common_tags
}


variable "ingress" {
  default = [
    {
      protocol  = "tcp"
      from_port = 80
      to_port   = 80
    }
  ]
}
