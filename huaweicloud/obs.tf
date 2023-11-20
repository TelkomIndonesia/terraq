data "huaweicloud_obs_buckets" "all" {}

locals {
  obs = data.huaweicloud_obs_buckets.all.buckets
}
