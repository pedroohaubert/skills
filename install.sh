#!/usr/bin/env bash
# Installs this repo on the machine. Runs the same in the public and private repos.
#   ./install.sh              everything this repo has
#   ./install.sh config       links config/<agent>/* into the agent's directory
#   ./install.sh dotfiles     links dotfiles/home/* into ~ and dotfiles/config/* into ~/.config
#   ./install.sh skills       installs skills/ globally via skills.sh
#   ./install.sh third-party  installs the skills listed in third-party-skills.txt
#   ./install.sh plugins      installs the Claude Code plugins listed in claude-plugins.txt
#   ./install.sh mcp          registers the MCP servers in mcp-servers.txt with Claude Code
#                             (OpenCode's live in config/opencode/opencode.jsonc)
# Anything already at the destination is moved to <file>.bak.<date> before linking.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS="claude-code opencode"

agent_dir() {
  case "$1" in
    agents) echo "$HOME/.agents" ;;
    claude) echo "$HOME/.claude" ;;
    opencode) echo "$HOME/.config/opencode" ;;
    *) echo "install.sh: agente desconhecido em config/: $1" >&2; return 1 ;;
  esac
}

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok      $dest"; return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "backup  $dest -> $backup"
  fi
  ln -s "$src" "$dest"
  echo "link    $dest -> $src"
}

link_tree() {
  local from="$1" to="$2" src
  [ -d "$from" ] || return 0
  while IFS= read -r src; do
    link "$src" "$to/${src#"$from"/}"
  done < <(find "$from" \( -type f -o -type l \))
}

install_config() {
  local dir
  [ -d "$REPO/config" ] || return 0
  for dir in "$REPO"/config/*/; do
    dir="${dir%/}"
    link_tree "$dir" "$(agent_dir "$(basename "$dir")")"
  done
}

install_dotfiles() {
  link_tree "$REPO/dotfiles/home" "$HOME"
  link_tree "$REPO/dotfiles/config" "$HOME/.config"
}

install_skills() {
  [ -d "$REPO/skills" ] || return 0
  # shellcheck disable=SC2046
  npx -y skills add "$REPO" -g -s '*' $(printf -- '-a %s ' $AGENTS) -y
}

install_third_party() {
  [ -f "$REPO/third-party-skills.txt" ] || return 0
  grep -vE '^\s*(#|$)' "$REPO/third-party-skills.txt" | while read -r repo skills; do
    # shellcheck disable=SC2046,SC2086
    npx -y skills add "$repo" -g $(printf -- '-a %s ' $AGENTS) $(printf -- '-s %s ' $skills) -y </dev/null
  done
}

install_mcp() {
  [ -f "$REPO/mcp-servers.txt" ] || return 0
  command -v claude >/dev/null || { echo "claude CLI not found; skipped MCP"; return 0; }
  grep -vE '^\s*(#|$)' "$REPO/mcp-servers.txt" | while read -r name url; do
    if claude mcp get "$name" >/dev/null 2>&1; then
      echo "ok      mcp $name"
    else
      claude mcp add "$name" --transport http --scope user "$url" </dev/null
    fi
  done
}

install_plugins() {
  [ -f "$REPO/claude-plugins.txt" ] || return 0
  command -v claude >/dev/null || { echo "claude CLI not found; skipped plugins"; return 0; }
  grep -vE '^\s*(#|$)' "$REPO/claude-plugins.txt" | while read -r marketplace plugin; do
    claude plugin marketplace add "$marketplace" </dev/null || true
    claude plugin install "$plugin" </dev/null || true
  done
}

case "${1:-all}" in
  config) install_config ;;
  dotfiles) install_dotfiles ;;
  skills) install_skills ;;
  third-party) install_third_party ;;
  mcp) install_mcp ;;
  plugins) install_plugins ;;
  all) install_config; install_dotfiles; install_skills; install_third_party; install_mcp; install_plugins ;;
  *) echo "uso: $0 [all|config|dotfiles|skills|third-party|mcp|plugins]" >&2; exit 1 ;;
esac
