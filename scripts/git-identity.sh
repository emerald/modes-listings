#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 1 ]; then
  printf "Usage: $0 <Emerald Source Directory>" 1>&2
fi

(cd "$1" && \
  git remote get-url origin | \
    tr ":" "/" | \
    sed "s/^git@/https:\\/\\//" | \
    sed "s/\\.git$//" | \
    sed "s/^/Git remote URL: /" && \
  git rev-parse HEAD | \
    sed "s/^/Git commit ID: /")
