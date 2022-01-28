# terraform-aws-activemq

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-activemq/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-activemq)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-activemq.svg)](https://github.com/JamesWoolfenden/terraform-aws-activemq/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-activemq.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-activemq/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-activemq/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-activemq&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-activemq/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-activemq&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is a very basic example.

![alt text](./diagram/message_queue.png)

Include **module.activemq.tf** this repository as a module in your existing Terraform code:

```terraform
module "activemq" {
  source      = "JamesWoolfenden/activemq/aws"
  version     = "v0.1.1"
  common_tags = var.common_tags
  subnet_ids  = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
  vpc_id      = element(tolist(data.aws_vpcs.main.ids), 0)
  mq_broker   = var.mq_broker
  my_config   = var.my_config
  username    = "NotAdmin"
  password    = random_password.password.result
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                        | Type     |
| --------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_mq_broker.broker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker)               | resource |
| [aws_mq_configuration.broker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_configuration) | resource |
| [aws_security_group.broker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)     | resource |

## Inputs

| Name                                                                                                                     | Description                                        | Type        | Default                                                                                           | Required |
| ------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------- | ----------- | ------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_audit"></a> [audit](#input_audit)                                                                         | To enable audit logging                            | `bool`      | `"false"`                                                                                         |    no    |
| <a name="input_common_tags"></a> [common_tags](#input_common_tags)                                                       | This is to help you add tags to your cloud objects | `map(any)`  | n/a                                                                                               |   yes    |
| <a name="input_ingress"></a> [ingress](#input_ingress)                                                                   | n/a                                                | `list(any)` | n/a                                                                                               |   yes    |
| <a name="input_logging"></a> [logging](#input_logging)                                                                   | To enable Logging to Cloudwatch                    | `bool`      | `true`                                                                                            |    no    |
| <a name="input_maintenance_window_start_time"></a> [maintenance_window_start_time](#input_maintenance_window_start_time) | Describe the Maintenance window block              | `map(any)`  | <pre>{<br> "day_of_week": "MONDAY",<br> "time_of_day": "12:05",<br> "time_zone": "GMT"<br>}</pre> |    no    |
| <a name="input_mq_broker"></a> [mq_broker](#input_mq_broker)                                                             | MQ broker details                                  | `map(any)`  | n/a                                                                                               |   yes    |
| <a name="input_my_config"></a> [my_config](#input_my_config)                                                             | MQ Config                                          | `map(any)`  | n/a                                                                                               |   yes    |
| <a name="input_password"></a> [password](#input_password)                                                                | n/a                                                | `string`    | n/a                                                                                               |   yes    |
| <a name="input_security_group_name"></a> [security_group_name](#input_security_group_name)                               | Broker Security group name                         | `string`    | `"Broker"`                                                                                        |    no    |
| <a name="input_subnet_ids"></a> [subnet_ids](#input_subnet_ids)                                                          | Contains subnet ids                                | `list(any)` | n/a                                                                                               |   yes    |
| <a name="input_username"></a> [username](#input_username)                                                                | n/a                                                | `string`    | `"ExampleUser"`                                                                                   |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                      | The VPC id                                         | `string`    | n/a                                                                                               |   yes    |

## Outputs

| Name                                                                       | Description              |
| -------------------------------------------------------------------------- | ------------------------ |
| <a name="output_broker"></a> [broker](#output_broker)                      | The Broker details       |
| <a name="output_configuration"></a> [configuration](#output_configuration) | The broker configuration |
| <a name="output_mq_password"></a> [mq_password](#output_mq_password)       | MQ password              |
| <a name="output_mq_username"></a> [mq_username](#output_mq_username)       | MQ Username              |

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

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-activemq&url=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-activemq&url=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-activemq
[share_email]: mailto:?subject=terraform-aws-activemq&body=https://github.com/JamesWoolfenden/terraform-aws-activemq
