data "huaweicloud_rds_flavors" "all" {
  for_each = toset(["MySQL", "PostgreSQL"])
  db_type  = each.key
}
data "huaweicloud_rds_instances" "all" {}

locals {
  rds = [
    for v in data.huaweicloud_rds_instances.all.instances :
    merge(v, {
      flavor = merge(
        [for f in data.huaweicloud_rds_flavors.all[v.db[0].type].flavors : f if f.name == v.flavor][0],
        {
          availability_zones = null
          db_versions        = null
        }
      )
    })
  ]
}
