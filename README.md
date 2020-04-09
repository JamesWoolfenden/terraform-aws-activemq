[![Slalom][logo]](https://slalom.com)

# terraform-aws-activemq

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-activemq/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-activemq)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-activemq.svg)](https://github.com/JamesWoolfenden/terraform-aws-activemq/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is just a basic example.

Include this repository as a module in your existing terraform code:

```terraform
module "activemq" {
  source      = "JamesWoolfenden/activemq/aws"
  version     = "0.0.4"
  common_tags = var.common_tags
  subnet_ids  = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
  vpc_id      = element(tolist(data.aws_vpcs.main.ids), 0)
  mq_broker   = var.mq_broker
  my_config   = var.my_config
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| audit | To enable audit logging | `bool` | `"false"` | no |
| common\_tags | This is to help you add tags to your cloud objects | `map` | n/a | yes |
| ingress | n/a | `list` | <pre>[<br>  {<br>    "from_port": 80,<br>    "protocol": "tcp",<br>    "to_port": 80<br>  }<br>]<br></pre> | no |
| logging | To enable Logging to Cloudwatch | `bool` | `true` | no |
| maintenance\_window\_start\_time | Describe the Maintenance window block | `map` | <pre>{<br>  "day_of_week": "MONDAY",<br>  "time_of_day": "12:05",<br>  "time_zone": "GMT"<br>}<br></pre> | no |
| mq\_broker | MQ broker details | `map` | n/a | yes |
| mq\_username | n/a | `string` | `"ExampleUser"` | no |
| my\_config | MQ Config | `map` | n/a | yes |
| password | n/a | `string` | n/a | yes |
| subnet\_ids | Contains subnet ids | `list` | n/a | yes |
| username | n/a | `string` | n/a | yes |
| vpc\_id | The VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| broker | The Broker details |
| configuration | The broker configuration |
| mq\_password | MQ password |
| mq\_username | MQ Username |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-activemq/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-activemq/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-activemq&url=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-activemq&url=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_email]: mailto:?subject=terraform-aws-activemq&body=https://github.com/JamesWoolfenden/terraform-aws-activemq
