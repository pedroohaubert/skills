# pstack configuration for OpenCode

The pstack OpenCode plugin reads this file from `~/.config/opencode/pstack-models.md`; it never reads the Claude Code copy in `~/.claude/`. Role model overrides stay out: pstack roles run on the session's model here. The line below stops the plugin from injecting the poteto-mode mandate into every session; pstack skills stay available and run only when the user invokes them.

session hook: off
