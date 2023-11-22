output "vpc" {
  value = local.vpc
}
output "eip" {
  value = local.eip
}
output "ecs" {
  value = local.ecs
}
output "evs" {
  value = local.evs
}
output "rds" {
  value = local.rds
}
output "cce" {
  value = local.cce
}
output "elb" {
  value = local.elb
}
output "secgroup" {
  value = local.secgroup
}
output "obs" {
  value = local.obs
}

output "nat" {
  value = local.nat
}


output "test" {
  value = flatten([
    for v in data.huaweicloud_vpc_route_table.all : [
      for r in v.route :
      r.nexthop if r.type == "nat"
    ]
  ])
}
