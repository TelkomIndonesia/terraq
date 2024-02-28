#!/bin/sh
set -euo pipefail

dir=${1:-"."}

trap "rm '$dir/terraform.tfstate'" EXIT
terraform -chdir="$dir" init -reconfigure -upgrade >/dev/null
terraform -chdir="$dir" refresh >/dev/null
terraform -chdir="$dir" output -json |
    jq 'with_entries(.value = .value.value)'
