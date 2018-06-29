output "registry_id" {
  value       = "${module.kops_ecr.registry_id}"
  description = "Registry ID"
}

output "registry_url" {
  value       = "${module.kops_ecr.repository_url}"
  description = "Registry URL"
}

output "repository_name" {
  value       = "${module.kops_ecr.name}"
  description = "Registry name"
}

output "role_name" {
  value       = "${module.kops_ecr.role_name}"
  description = "Assume Role name to get access registry"
}

output "role_arn" {
  value       = "${module.kops_ecr.role_arn}"
  description = "Assume Role ARN to get access registry"
}
