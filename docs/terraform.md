
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| cluster_name | Kops cluster name (e.g. `us-east-1.cloudposse.com` or `cluster-1.cloudposse.com`) | string | - | yes |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| masters_name | Kops masters subdomain name in the cluster DNS zone | string | `masters` | no |
| name | Name (e.g. `external-dns`) | string | `external-dns` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| nodes_name | Kops nodes subdomain name in the cluster DNS zone | string | `nodes` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`Cluster`,`us-east-1.cloudposse.com`) | map | `<map>` | no |
| users | User names to grant permissions | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| registry_id | Registry ID |
| registry_url | Registry URL |
| repository_name | Registry name |
| role_arn | Assume Role ARN to get access registry |
| role_name | Assume Role name to get access registry |

