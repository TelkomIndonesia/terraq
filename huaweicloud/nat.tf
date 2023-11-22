data "huaweicloud_nat_gateway" "all" {
  # WARN: unstable
  # HuaweiCloud provider does not have list of nat and private nat data source
  # So here we get it from route table
  for_each = toset(distinct(flatten([
    for v in data.huaweicloud_vpc_route_table.all : [
      for r in v.route :
      r.nexthop if r.type == "nat" && r.destination == "0.0.0.0/0"
    ]
  ])))

  id = each.key
}

locals {
  nat = values(data.huaweicloud_nat_gateway.all)
}
