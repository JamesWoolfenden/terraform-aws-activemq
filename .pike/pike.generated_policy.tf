resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateNetworkInterface",
          "ec2:CreateNetworkInterfacePermission",
          "ec2:CreateSecurityGroup",
          "ec2:CreateTags",
          "ec2:DeleteNetworkInterface",
          "ec2:DeleteNetworkInterfacePermission",
          "ec2:DeleteSecurityGroup",
          "ec2:DeleteTags",
          "ec2:DescribeAccountAttributes",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "ec2:DetachNetworkInterface",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "VisualEditor1",
        "Effect" : "Allow",
        "Action" : [
          "mq:CreateBroker",
          "mq:CreateConfiguration",
          "mq:CreateTags",
          "mq:CreateUser",
          "mq:DeleteBroker",
          "mq:DeleteTags",
          "mq:DeleteUser",
          "mq:DescribeBroker",
          "mq:DescribeConfiguration",
          "mq:DescribeConfigurationRevision",
          "mq:DescribeUser",
          "mq:RebootBroker",
          "mq:UpdateBroker",
          "mq:UpdateConfiguration",
          "mq:UpdateUser"
        ],
        "Resource" : "*"
      }
    ]
  })
}
