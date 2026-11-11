#!/usr/bin/env bash
# Vendors kosta4a/tactile-design (MIT) into ./tactile. One change from upstream:
# SKILL.md becomes GUIDE.md (and references to it are renamed), so skills.sh
# does not install it as a separate skill.
# Rerun to update; review the diff before committing.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git clone --quiet --depth 1 https://github.com/kosta4a/tactile-design "$TMP/src"

rm -rf "$HERE/tactile"
cp -R "$TMP/src/skills/tactile-design" "$HERE/tactile"
mv "$HERE/tactile/SKILL.md" "$HERE/tactile/GUIDE.md"
grep -rl 'SKILL\.md' "$HERE/tactile" | while IFS= read -r file; do
  sed -i.bak 's/SKILL\.md/GUIDE.md/g' "$file" && rm "$file.bak"
done
cp "$TMP/src/LICENSE" "$HERE/tactile/LICENSE"
git -C "$TMP/src" log -1 --format='kosta4a/tactile-design %H %cs' > "$HERE/tactile/VERSION"

cat "$HERE/tactile/VERSION"
ls "$HERE/tactile"
