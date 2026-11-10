#!/usr/bin/env bash
# Copies a text file to the system clipboard, byte for byte.
# Usage: copy.sh <file>
set -euo pipefail

file="${1:?usage: copy.sh <file>}"
[ -s "$file" ] || { echo "copy.sh: $file is missing or empty" >&2; exit 1; }

if command -v pbcopy >/dev/null; then pbcopy < "$file"
elif command -v wl-copy >/dev/null; then wl-copy < "$file"
elif command -v xclip >/dev/null; then xclip -selection clipboard < "$file"
elif command -v clip.exe >/dev/null; then clip.exe < "$file"
else echo "copy.sh: no clipboard tool found (pbcopy, wl-copy, xclip, clip.exe)" >&2; exit 1
fi

echo "copied $(wc -m < "$file" | tr -d ' ') characters to the clipboard"
