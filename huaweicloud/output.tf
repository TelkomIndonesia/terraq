
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

output "nat" {
  value = local.nat
}

output "obs" {
  value = local.obs
}

output "rds" {
  value = local.rds
}
output "rds_backup_strategy" {
  value = local.rds_backup_strategy
}
output "rds_db" {
  value = local.rds_db
}
output "rds_nodes" {
  value = local.rds_nodes
}
output "rds_volume" {
  value = local.rds_volume
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
