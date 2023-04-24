resource "aws_security_group" "broker" {
  description = "broker security: Managed by Terraform"
  egress {
    #tfsec:ignore:aws-ec2-no-public-egress-sgr
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = var.ingress
    description = "MQ port"
    from_port   = 61616
    protocol    = "tcp"
    self        = false
    to_port     = 61616
  }


  name_prefix = var.security_group_name
  vpc_id      = var.vpc_id
  tags        = var.common_tags
}
