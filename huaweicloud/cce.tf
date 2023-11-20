data "huaweicloud_cce_clusters" "all" {}

locals {
  cce = [
    for v in data.huaweicloud_cce_clusters.all.clusters :
    merge(v, {
      certificate_users = null
      kube_config_raw   = null
    })
  ]
}
