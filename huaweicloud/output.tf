
output "cce" {
  value = local.cce
}
output "cce_certificate_clusters" {
  value = local.cce_certificate_clusters
}
output "cce_endpoints" {
  value = local.cce_endpoints
}
output "cce_masters" {
  value = local.cce_masters
}

output "ecs" {
  value = local.ecs
}
output "ecs_networks" {
  value = local.ecs_networks
}
output "ecs_volumes" {
  value = local.ecs_volumes
}

output "eip" {
  value = local.eip
}

output "elb" {
  value = local.elb
}


output "evs" {
  value = local.evs
}
output "evs_attachments" {
  value = local.evs_attachments
}

output "iam_users" {
  value = local.iam_users
}
output "iam_permission" {
  value = local.iam_permissions
}

output "nat_gateways" {
  value = local.nat_gateways
}
output "nat_private_gateways" {
  value = local.nat_private_gateways
}

output "obs" {
  value = local.obs
}

output "rds" {
  value = local.rds
}
output "rds_backup_strategies" {
  value = local.rds_backup_strategies
}
output "rds_databases" {
  value = local.rds_databases
}
output "rds_nodes" {
  value = local.rds_nodes
}
output "rds_volumes" {
  value = local.rds_volumes
}

output "secgroup" {
  value = local.secgroup
}
output "secgroup_rules" {
  value = local.secgroup_rules
}

output "vpc" {
  value = local.vpc
}
output "vpc_subnets" {
  value = local.vpc_subnets
}
output "vpc_route_tables" {
  value = local.vpc_route_tables
}

output "waf_domains" {
  value = local.waf_domains
}
