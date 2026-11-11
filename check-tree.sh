#!/usr/bin/env bash
# Checks the instruction tree in config/agents/:
#   - word budgets (root 800, every other file 2000): generous on purpose, so lessons get written down instead of trimmed away
#   - at most 14 pointers per file
#   - every `~/.agents/...` pointer resolves to a file
#   - every file is reachable from the root within 4 levels
set -euo pipefail

TREE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/config/agents"
ROOT_BUDGET=800; NODE_BUDGET=2000; MAX_CHILDREN=14; MAX_DEPTH=4
fail=0
err() { echo "FAIL  $*"; fail=1; }

pointers() { grep -oE '~/\.agents/[A-Za-z0-9_./-]+\.md' "$1" | sort -u | sed 's#^~/\.agents/##' || true; }

reached=" AGENTS.md "
level="AGENTS.md"
depth=1
while [ -n "$level" ]; do
  next=""
  for file in $level; do
    words=$(wc -w < "$TREE/$file" | tr -d ' ')
    budget=$NODE_BUDGET; [ "$file" = "AGENTS.md" ] && budget=$ROOT_BUDGET
    [ "$words" -le "$budget" ] || err "$file has $words words (budget $budget)"
    kids=$(pointers "$TREE/$file")
    count=$(printf '%s\n' "$kids" | grep -c . || true)
    [ "$count" -le "$MAX_CHILDREN" ] || err "$file has $count pointers (max $MAX_CHILDREN)"
    printf '%-28s %4s words  %s pointers  level %s\n' "$file" "$words" "$count" "$depth"
    for kid in $kids; do
      if [ ! -f "$TREE/$kid" ]; then err "$file points at missing $kid"; continue; fi
      case "$reached" in *" $kid "*) continue ;; esac
      reached="$reached$kid "
      next="$next $kid"
    done
  done
  level="$next"
  depth=$((depth + 1))
  if [ -n "$level" ] && [ "$depth" -gt "$MAX_DEPTH" ]; then err "deeper than $MAX_DEPTH levels:$level"; break; fi
done

while IFS= read -r path; do
  rel="${path#"$TREE"/}"
  case "$reached" in *" $rel "*) ;; *) err "$rel is not reachable from AGENTS.md" ;; esac
done < <(find "$TREE" -name '*.md' -type f)

[ "$fail" -eq 0 ] && echo "OK    tree is within budget and fully linked"
exit "$fail"
