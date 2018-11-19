variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = "string"
  description = "Name (e.g. `external-dns`)"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "use_fullname" {
  type        = "string"
  default     = "true"
  description = "Set 'true' to use `namespace-stage-name` for ecr repository name, else `name`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`Cluster`,`us-west-2.cloudposse.co`)"
}

variable "cluster_name" {
  type        = "string"
  description = "Kops cluster name (e.g. `us-west-2.cloudposse.co` or `cluster-1.cloudposse.co`)"
}

variable "masters_name" {
  type        = "string"
  default     = "masters"
  description = "Kops masters subdomain name in the cluster DNS zone"
}

variable "nodes_name" {
  type        = "string"
  default     = "nodes"
  description = "Kops nodes subdomain name in the cluster DNS zone"
}

variable "roles" {
  type        = "list"
  default     = []
  description = "Roles name to grant docker registry login/read/write permissions"
}
