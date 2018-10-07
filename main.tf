module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.7"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  delimiter  = "${var.delimiter}"
  attributes = "${var.attributes}"
  tags       = "${var.tags}"
}

module "kops_metadata" {
  source       = "git::https://github.com/cloudposse/terraform-aws-kops-metadata.git?ref=tags/0.1.1"
  dns_zone     = "${var.cluster_name}"
  masters_name = "${var.masters_name}"
  nodes_name   = "${var.nodes_name}"
}

module "kops_ecr" {
  source       = "git::https://github.com/cloudposse/terraform-aws-ecr.git?tags/0.2.11"
  name         = "${var.name}"
  namespace    = "${var.namespace}"
  stage        = "${var.stage}"
  use_fullname = "${var.use_fullname}"

  roles = [
    "${module.kops_metadata.masters_role_name}",
    "${module.kops_metadata.nodes_role_name}",
  ]
}

resource "aws_iam_policy_attachment" "login" {
  count      = "${signum(length(var.users))}"
  name       = "${module.label.id}"
  users      = ["${var.users}"]
  policy_arn = "${module.kops_ecr.policy_login_arn}"
}

resource "aws_iam_policy_attachment" "read" {
  count      = "${signum(length(var.users))}"
  name       = "${module.label.id}"
  users      = ["${var.users}"]
  policy_arn = "${module.kops_ecr.policy_read_arn}"
}

resource "aws_iam_policy_attachment" "write" {
  count      = "${signum(length(var.users))}"
  name       = "${module.label.id}"
  users      = ["${var.users}"]
  policy_arn = "${module.kops_ecr.policy_write_arn}"
}
