data "huaweicloud_vpcs" "all" {}
data "huaweicloud_vpc_subnets" "all" {
  for_each = { for instance in data.huaweicloud_vpcs.all.vpcs : instance.id => instance }
  vpc_id   = each.key
}

data "huaweicloud_vpc_route_table" "all" {
  for_each = { for instance in data.huaweicloud_vpcs.all.vpcs : instance.id => instance }
  vpc_id   = each.key
}

locals {
  vpc = data.huaweicloud_vpcs.all.vpcs
  vpc_subnets = flatten([
    for k, v in data.huaweicloud_vpc_subnets.all : [
      for s in v.subnets :
      merge(s, { vpc_id = k })
    ]
  ])
  vpc_route_tables = flatten([
    for k, v in data.huaweicloud_vpc_route_table.all : [
      for r in v.route :
      merge(r, { vpc_id = k })
    ]
  ])
}
