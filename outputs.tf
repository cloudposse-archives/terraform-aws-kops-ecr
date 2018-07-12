output "registry_id" {
  value       = "${module.kops_ecr.registry_id}"
  description = "Registry ID"
}

output "registry_url" {
  value       = "${module.kops_ecr.registry_url}"
  description = "Registry URL"
}

output "repository_name" {
  value       = "${module.kops_ecr.repository_name}"
  description = "Repository name"
}

output "role_name" {
  value       = "${module.kops_ecr.role_name}"
  description = "Role name to get access to the registry"
}

output "role_arn" {
  value       = "${module.kops_ecr.role_arn}"
  description = "Role ARN to get access to the registry"
}
