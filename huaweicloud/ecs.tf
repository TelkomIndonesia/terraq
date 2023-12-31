data "huaweicloud_compute_flavors" "all" {}
data "huaweicloud_compute_instances" "all" {}

locals {
  ecs = [
    for v in data.huaweicloud_compute_instances.all.instances :
    merge(v, {
      flavor      = [for f in data.huaweicloud_compute_flavors.all.flavors : f if f.id == v.flavor_id][0]
      flavor_id   = null
      flavor_name = null
      user_data   = null

      # split
      network         = null
      volume_attached = null
    })
  ]
  ecs_networks = flatten([
    for ecs in data.huaweicloud_compute_instances.all.instances : [
      for v in ecs.network :
      merge(v, { ecs_id : ecs.id })
    ]
  ])
  ecs_volumes = flatten([
    for ecs in data.huaweicloud_compute_instances.all.instances : [
      for v in ecs.volume_attached :
      merge(v, { ecs_id : ecs.id })
    ]
  ])
}
