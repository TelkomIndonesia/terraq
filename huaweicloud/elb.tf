data "huaweicloud_elb_flavors" "all" {}
data "huaweicloud_elb_loadbalancers" "all" {}

locals {
  elb = [
    for v in data.huaweicloud_elb_loadbalancers.all.loadbalancers :
    merge(v, {
      l4_flavor    = try([for f in data.huaweicloud_elb_flavors.all.flavors : f if f.id == v.l4_flavor_id][0], null)
      l7_flavor    = try([for f in data.huaweicloud_elb_flavors.all.flavors : f if f.id == v.l7_flavor_id][0], null)
      l4_flavor_id = null
      l7_flavor_id = null
    })
  ]
}
