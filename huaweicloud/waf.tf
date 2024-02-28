data "huaweicloud_waf_domains" "all" {}

locals {
  waf_domains = data.huaweicloud_waf_domains.all.domains
}
