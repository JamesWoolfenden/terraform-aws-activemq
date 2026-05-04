resource "aws_kms_key" "example" {
  # checkov:skip=CKV2_AWS_64: For example only, key policy managed via IAM
  enable_key_rotation = true
  tags                = var.common_tags
  policy = jsonencode({
    "Sid" : "Enable IAM User Permissions",
    "Effect" : "Allow",
    "Principal" : {
      "AWS" : "arn:aws:iam::680235478471:root"
    },
    "Action" : "kms:*",
    "Resource" : "*"
  })
}
