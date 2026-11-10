#!/usr/bin/env bash
# Vendors blader/humanizer (MIT) into ./humanizer, unmodified except that the
# skill frontmatter is stripped and SKILL.md is saved as GUIDE.md, so skills.sh
# does not install it as a separate skill. Our adaptations live in ../tells.md.
# Rerun to update; review the diff before committing.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git clone --quiet --depth 1 https://github.com/blader/humanizer "$TMP/src"

rm -rf "$HERE/humanizer"
mkdir -p "$HERE/humanizer"
awk 'NR==1 && /^---$/ {skip=1; next} skip && /^---$/ {skip=0; next} !skip' "$TMP/src/SKILL.md" > "$HERE/humanizer/GUIDE.md"
cp "$TMP/src/LICENSE" "$HERE/humanizer/LICENSE"
git -C "$TMP/src" log -1 --format='blader/humanizer %H %cs' > "$HERE/humanizer/VERSION"

cat "$HERE/humanizer/VERSION"
wc -w "$HERE/humanizer/GUIDE.md"
