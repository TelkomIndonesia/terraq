data "huaweicloud_identity_users" "all" {}

data "huaweicloud_identity_permissions" "custom" {
  type = "custom"
}

locals {
  iam_users       = data.huaweicloud_identity_users.all.users
  iam_permissions = data.huaweicloud_identity_permissions.custom.permissions
}
