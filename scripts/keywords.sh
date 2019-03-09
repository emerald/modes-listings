#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 1 ]; then
  printf "Usage: $0 <Emerald Source Directory>" 1>&2
fi

"$1/bin/getkeywords.sh" | \
  sed -e "s/$/,/g" | \
  paste -d " " - - | \
  paste -d " " - - | \
  sed -e "s/^/    /g"
