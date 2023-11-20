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
  vpc = [
    for v in data.huaweicloud_vpcs.all.vpcs :
    merge(v, {
      subnets      = try(data.huaweicloud_vpc_subnets.all[v.id].subnets, null)
      route_tables = try(data.huaweicloud_vpc_route_table.all[v.id].route, null)
    })
  ]
}
