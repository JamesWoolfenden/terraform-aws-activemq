data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  filter {
    name   = "tag:Type"
    values = [var.sub_public_tag]
  }
}
data "aws_subnets" "private" {

  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  filter {
    name   = "tag:Type"
    values = [var.sub_private_tag]
  }
}
data "aws_vpcs" "main" {
  tags = {
    Name = var.vpc_name_tag
  }
}
data "aws_caller_identity" "current" {}
