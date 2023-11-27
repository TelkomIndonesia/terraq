data "huaweicloud_evs_volumes" "all" {}

locals {
  evs = [
    for evs in data.huaweicloud_evs_volumes.all.volumes :
    merge(evs, {
      # split
      attachments = null
      }
    )
  ]
  evs_attachments = flatten([
    for evs in data.huaweicloud_evs_volumes.all.volumes : [
      for a in evs.attachments :
      merge(a, { evs_id : evs.id })
    ]
  ])
}
