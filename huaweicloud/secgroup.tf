data "huaweicloud_networking_secgroups" "all" {}
data "huaweicloud_networking_secgroup" "all" {
  for_each    = { for v in data.huaweicloud_networking_secgroups.all.security_groups : v.id => v }
  secgroup_id = each.key
}

locals {
  secgroup = [
    for v in data.huaweicloud_networking_secgroups.all.security_groups :
    merge(v, {
      rules = try(data.huaweicloud_networking_secgroup.all[v.id].rules, null)
    })
  ]
}
