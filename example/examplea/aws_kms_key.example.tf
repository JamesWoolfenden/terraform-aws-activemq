resource "aws_kms_key" "example" {
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
