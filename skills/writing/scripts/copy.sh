#!/usr/bin/env bash
# Copies a text file to the system clipboard, byte for byte.
# Usage: copy.sh <file>. A .html file goes in as rich text (lists, bold, spacing
# survive a paste into Teams or email), with a plain-text fallback.
set -euo pipefail

file="${1:?usage: copy.sh <file>}"
[ -s "$file" ] || { echo "copy.sh: $file is missing or empty" >&2; exit 1; }

if [[ "$file" == *.html ]] && command -v osascript >/dev/null; then
  plain=$(textutil -convert txt -stdout "$file")
  osascript -l JavaScript - "$file" "$plain" >/dev/null <<'JS'
ObjC.import('AppKit');
function run(a) {
  const html = $.NSString.stringWithContentsOfFileEncodingError(a[0], $.NSUTF8StringEncoding, null);
  const pb = $.NSPasteboard.generalPasteboard;
  pb.clearContents;
  pb.setStringForType(html, 'public.html');
  pb.setStringForType(a[1], 'public.utf8-plain-text');
}
JS
elif command -v pbcopy >/dev/null; then pbcopy < "$file"
elif command -v wl-copy >/dev/null; then wl-copy < "$file"
elif command -v xclip >/dev/null; then xclip -selection clipboard < "$file"
elif command -v clip.exe >/dev/null; then clip.exe < "$file"
else echo "copy.sh: no clipboard tool found (pbcopy, wl-copy, xclip, clip.exe)" >&2; exit 1
fi

echo "copied $(wc -m < "$file" | tr -d ' ') characters to the clipboard"
