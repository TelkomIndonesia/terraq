data "huaweicloud_cce_clusters" "all" {}

locals {
  cce = [
    for v in data.huaweicloud_cce_clusters.all.clusters :
    merge(v, {
      certificate_users = null
      kube_config_raw   = null

      # split
      certificate_clusters = null
      endpoints            = null
      masters              = null
    })
  ]
  cce_certificate_clusters = flatten([
    for cce in data.huaweicloud_cce_clusters.all.clusters : [
      for v in cce.certificate_clusters :
      merge(v, { cce_id : cce.id })
    ]
  ])
  cce_endpoints = flatten([
    for cce in data.huaweicloud_cce_clusters.all.clusters : [
      for v in cce.endpoints :
      merge(v, { cce_id : cce.id })
    ]
  ])
  cce_masters = flatten([
    for cce in data.huaweicloud_cce_clusters.all.clusters : [
      for v in cce.masters :
      merge(v, { cce_id : cce.id })
    ]
  ])
}
