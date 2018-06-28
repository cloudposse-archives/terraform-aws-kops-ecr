# terraform-aws-kops-ecr [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-kops-ecr.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-kops-ecr)

Terraform module to provision an ECR repository and grant users and kubernetes nodes access to it.

## Overview

The module uses [terraform-aws-kops-metadata](https://github.com/cloudposse/terraform-aws-kops-metadata) to lookup resources within a Kops cluster for easier integration with Terraform.


## Usage

```hcl
module "cicd_user" {
  source    = "git::https://github.com/cloudposse/terraform-aws-iam-system-user.git?ref=tags/0.3.0"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "codefresh"

  tags = {
    Cluster = "${var.kops_cluster_name}"
  }
}

module "kops_ecr_app" {
  source       = "git::https://github.com/cloudposse/terraform-aws-kops-ecr.git?ref=tags/0.1.0"
  namespace    = "${var.namespace}"
  stage        = "${var.stage}"
  name         = "app"
  cluster_name = "${var.kops_cluster_name}"

  users = [
    "${module.cicd_user.user_name}"
  ]

  tags = {
    Cluster = "${var.kops_cluster_name}"
  }
}

```

## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-kops-external-dns/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-kops-external-dns/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `terraform-aws-kops-external-dns`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`terraform-aws-kops-external-dns` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)


Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud platform.

  [website]: https://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: https://cloudposse.com/contact/


## Contributors

| [![Igor Rodionov][igor_img]][igor_web]<br/>[Igor Rodionov][igor_img] |
|-------------------------------------------------------|

[igor_img]: http://s.gravatar.com/avatar/bc70834d32ed4517568a1feb0b9be7e2?s=144
[igor_web]: https://github.com/goruha/
