#!/usr/bin/env bash
# Vendors emilkowalski/skills (MIT) into ./emil. Two changes from upstream:
#   - each SKILL.md becomes GUIDE.md (and references to it are renamed), so
#     skills.sh does not install the guides as separate skills;
#   - pick-ui-library is dropped: ../libraries.md replaces it.
# Rerun to update; review the diff before committing.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git clone --quiet --depth 1 https://github.com/emilkowalski/skills "$TMP/src"

rm -rf "$HERE/emil"
mkdir -p "$HERE/emil"
for dir in "$TMP"/src/skills/*/; do
  name="$(basename "$dir")"
  cp -R "$dir" "$HERE/emil/$name"
  mv "$HERE/emil/$name/SKILL.md" "$HERE/emil/$name/GUIDE.md"
done
rm -rf "$HERE/emil/pick-ui-library"
grep -rl 'SKILL\.md' "$HERE/emil" | while IFS= read -r file; do
  sed -i.bak 's/SKILL\.md/GUIDE.md/g' "$file" && rm "$file.bak"
done
cp "$TMP/src/LICENSE" "$HERE/emil/LICENSE"
git -C "$TMP/src" log -1 --format='emilkowalski/skills %H %cs' > "$HERE/emil/VERSION"

cat "$HERE/emil/VERSION"
ls "$HERE/emil"
