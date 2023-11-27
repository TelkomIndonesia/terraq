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

      # split 
      backup_strategy = null
      db              = null
      nodes           = null
      volume          = null
    })
  ]
  rds_backup_strategies = flatten([
    for rds in data.huaweicloud_rds_instances.all.instances : [
      for v in rds.backup_strategy :
      merge(v, { rds_id = rds.id })
    ]
  ])
  rds_databases = flatten([
    for rds in data.huaweicloud_rds_instances.all.instances : [
      for v in rds.db :
      merge(v, { rds_id = rds.id })
    ]
  ])
  rds_nodes = flatten([
    for rds in data.huaweicloud_rds_instances.all.instances : [
      for v in rds.nodes :
      merge(v, { rds_id = rds.id })
    ]
  ])
  rds_volumes = flatten([
    for rds in data.huaweicloud_rds_instances.all.instances : [
      for v in rds.volume :
      merge(v, { rds_id = rds.id })
    ]
  ])
}
