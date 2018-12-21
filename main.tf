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
  source       = "git::https://github.com/cloudposse/terraform-aws-ecr.git?ref=fix-iam-limit-solution-2"
  name         = "${var.name}"
  namespace    = "${var.namespace}"
  stage        = "${var.stage}"
  use_fullname = "${var.use_fullname}"

  principal = [ "${var.principal}" ]

  principal_readonly = [
    "${module.kops_metadata.masters_role_arn}",
    "${module.kops_metadata.nodes_role_arn}",
  ]
}
