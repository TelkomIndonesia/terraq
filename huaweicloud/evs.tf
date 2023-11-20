data "huaweicloud_evs_volumes" "all" {}

locals {
  evs = data.huaweicloud_evs_volumes.all.volumes
}
