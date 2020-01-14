resource "aws_security_group" "broker" {
  description = "Managed by Terraform"
  egress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80

  }

  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
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
