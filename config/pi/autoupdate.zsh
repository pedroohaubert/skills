# Updates Pi and its packages before each interactive start. Source it from ~/.zshrc:
#   source ~/.pi/agent/autoupdate.zsh
# Subcommands (install, update, mcp, ...) and offline runs start without updating;
# a failed update (no network) never blocks the start.
pi() {
  case "${1:-}" in
    install|remove|uninstall|update|list|config|auth|mcp|--offline|-h|--help|-v|--version) ;;
    *)
      if [ -z "${PI_OFFLINE:-}" ]; then
        command pi update --all </dev/null 2>&1 | grep -v -E 'already up to date|^Updating ' || true
      fi
      ;;
  esac
  command pi "$@"
}
