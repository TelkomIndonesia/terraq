data "huaweicloud_vpc_eips" "all" {}

locals {
  eip = data.huaweicloud_vpc_eips.all.eips
}
