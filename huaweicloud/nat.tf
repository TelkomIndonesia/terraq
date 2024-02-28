data "huaweicloud_nat_gateways" "all" {}
data "huaweicloud_nat_private_gateways" "all" {}

locals {
  nat_gateways         = data.huaweicloud_nat_gateways.all.gateways
  nat_private_gateways = data.huaweicloud_nat_private_gateways.all.gateways
}
