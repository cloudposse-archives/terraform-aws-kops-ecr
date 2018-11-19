
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| cluster_name | Kops cluster name (e.g. `us-west-2.cloudposse.co` or `cluster-1.cloudposse.co`) | string | - | yes |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| masters_name | Kops masters subdomain name in the cluster DNS zone | string | `masters` | no |
| name | Name (e.g. `external-dns`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| nodes_name | Kops nodes subdomain name in the cluster DNS zone | string | `nodes` | no |
| roles | Roles name to grant docker registry login/read/write permissions | list | `<list>` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`Cluster`,`us-west-2.cloudposse.co`) | map | `<map>` | no |
| use_fullname | Set 'true' to use `namespace-stage-name` for ecr repository name, else `name` | string | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| registry_id | Registry ID |
| registry_url | Registry URL |
| repository_name | Repository name |
| role_arn | Role ARN to get access to the registry |
| role_name | Role name to get access to the registry |

