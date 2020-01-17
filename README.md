[![Slalom][logo]](https://slalom.com)

# terraform-aws-activemq [![Build Status](https://github.com/JamesWoolfenden/terraform-aws-activemq/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-activemq) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-activemq.svg)](https://github.com/JamesWoolfenden/terraform-aws-activemq/releases/latest)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is just a basic example.

Include this repository as a module in your existing terraform code:

```terraform
module "acivemq" {
  source            = "JamesWoolfenden/activemq/aws"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| common\_tags | This is to help you add tags to your cloud objects | map | n/a | yes |
| ingress |  | list | `<list>` | no |
| logs | Describes the logs block | map | `<map>` | no |
| maintenance\_window\_start\_time | Describe the Maintenance window block | map | `<map>` | no |
| mq\_broker | MQ broker details | map | n/a | yes |
| mq\_username |  | string | `"ExampleUser"` | no |
| my\_config | MQ Config | map | n/a | yes |
| subnet\_ids | Contains subnet ids | list | n/a | yes |
| vpc\_id | The VPC id | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| broker |  |
| configuration |  |
| mq\_password |  |
| mq\_username |  |

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

Copyright � 2019-2020 [Slalom, LLC](https://slalom.com)

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