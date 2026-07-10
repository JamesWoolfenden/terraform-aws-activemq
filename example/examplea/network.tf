data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "activemq" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "activemq-example"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.activemq.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "activemq-example-private"
    Type = "private"
  }
}

resource "aws_cloudwatch_log_group" "flow_logs" {
  name              = "/activemq-example/flow-logs-${lower(random_string.name.result)}"
  retention_in_days = 365
  kms_key_id        = aws_kms_key.broker.arn
}

resource "aws_default_security_group" "activemq" {
  vpc_id = aws_vpc.activemq.id
}

# holden:ignore:HLD_AWS_152
resource "aws_iam_role" "flow_logs" {
  name = "activemq-example-flow-logs-${lower(random_string.name.result)}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "flow_logs" {
  name = "activemq-example-flow-logs"
  role = aws_iam_role.flow_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
        ]
        Resource = "${aws_cloudwatch_log_group.flow_logs.arn}:*"
      }
    ]
  })
}

resource "aws_flow_log" "activemq" {
  vpc_id                   = aws_vpc.activemq.id
  traffic_type             = "ALL"
  log_destination_type     = "cloud-watch-logs"
  log_destination          = aws_cloudwatch_log_group.flow_logs.arn
  iam_role_arn             = aws_iam_role.flow_logs.arn
  max_aggregation_interval = 60
}
