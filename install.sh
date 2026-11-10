#!/usr/bin/env bash
# Instala este repo na máquina. Roda igual no repo público e no privado.
#   ./install.sh              tudo o que existir neste repo
#   ./install.sh config       linka config/<agente>/* no diretório do agente
#   ./install.sh dotfiles     linka dotfiles/home/* em ~ e dotfiles/config/* em ~/.config
#   ./install.sh skills       instala skills/ globalmente via skills.sh
#   ./install.sh third-party  instala as skills listadas em third-party-skills.txt
#   ./install.sh mcp          registra no Claude Code os servidores MCP de mcp-servers.txt
#                             (os do OpenCode ficam em config/opencode/opencode.jsonc)
# Tudo que já existe no destino vai para <arquivo>.bak.<data> antes do link.
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
  command -v claude >/dev/null || { echo "claude CLI não encontrado; pulei o MCP"; return 0; }
  grep -vE '^\s*(#|$)' "$REPO/mcp-servers.txt" | while read -r name url; do
    if claude mcp get "$name" >/dev/null 2>&1; then
      echo "ok      mcp $name"
    else
      claude mcp add "$name" --transport http --scope user "$url" </dev/null
    fi
  done
}

case "${1:-all}" in
  config) install_config ;;
  dotfiles) install_dotfiles ;;
  skills) install_skills ;;
  third-party) install_third_party ;;
  mcp) install_mcp ;;
  all) install_config; install_dotfiles; install_skills; install_third_party; install_mcp ;;
  *) echo "uso: $0 [all|config|dotfiles|skills|third-party|mcp]" >&2; exit 1 ;;
esac
