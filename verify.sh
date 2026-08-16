#!/bin/bash
# The pilot repository's only check. It fails when any tracked file declares a defect marker,
# so a candidate that "claims it works" but carries the marker cannot land (issue #26, AC-GH-09a).
set -euo pipefail
if git grep -n "SEEDED_DEFECT" -- . ':!verify.sh' ':!.github/**' >/dev/null 2>&1; then
  echo "verify: seeded defect marker present" >&2
  git grep -n "SEEDED_DEFECT" -- . ':!verify.sh' ':!.github/**' >&2 || true
  exit 1
fi
echo "verify: ok"
