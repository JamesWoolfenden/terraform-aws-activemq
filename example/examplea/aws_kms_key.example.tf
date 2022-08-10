resource "aws_kms_key" "example" {
  enable_key_rotation = true
  tags                = var.common_tags
}
