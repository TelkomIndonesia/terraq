data "huaweicloud_networking_secgroups" "all" {}
data "huaweicloud_networking_secgroup" "all" {
  for_each    = { for v in data.huaweicloud_networking_secgroups.all.security_groups : v.id => v }
  secgroup_id = each.key
}

locals {
  secgroup = data.huaweicloud_networking_secgroups.all.security_groups
  secgroup_rules = flatten([
    for k, v in data.huaweicloud_networking_secgroup.all : [
      for r in v.rules :
      merge(r, { secgroup_id = k })
    ]
  ])
}
