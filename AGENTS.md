# AGENTS.md

Public repo with Pedro's skills and agent setup, installable with `npx skills add pedroohaubert/skills`. A private twin, `pedroohaubert/skills-private`, has the same layout and the same `install.sh`.

- Public holds what is generic and serves software development. Personal or work skills, dotfiles, and anything naming a project path, client, colleague, internal URL, corporate email, or credential go to the private repo.
- Every file an agent reads (skills, AGENTS.md, playbooks, config) is written in English. Human-facing docs (README, referencias.md) stay in Portuguese.
- Load the `writing-for-agents` skill before writing or editing any of those files.
- Skills live in `skills/<name>/SKILL.md`, with `name` matching the folder. `SKILL.md` exists only under `skills/`: skills.sh scans the whole repo and installs any it finds.
- `config/<target>/` mirrors a machine directory: `agents` → `~/.agents`, `claude` → `~/.claude`, `opencode` → `~/.config/opencode`. Agent-neutral material goes in `agents`; config for one agent goes in its own folder. A new target needs a line in `agent_dir` in `install.sh`.
- `config/agents/` is an instruction tree: `AGENTS.md` is the root every agent reads on every task (replies, autonomy, done, delegation, plus a table of branches); branches (`code.md`, `setup.md`) and `playbooks/` are read only when their case fires. Point at them with plain `~/.agents/...` paths, never `@` imports, which load eagerly. Run `./check-tree.sh` after any edit.
- Claude Code reaches the root through `config/claude/CLAUDE.md` (an `@` import); OpenCode through the `config/opencode/AGENTS.md` symlink. Both load it alongside a project's own instructions.
- `referencias.md` records what was studied and what we took from each source. Read it before proposing a setup change; add any article, post, or repo the user sends.
- `skills/design/` is the design branch of the tree: a router (`SKILL.md`) over the user's own files and Emil Kowalski's skills vendored under `emil/` (MIT). Never edit `emil/` by hand; run `skills/design/sync-emil.sh` to update it. After changing the skill, reinstall it with `./install.sh skills`.
- Other third-party skills are not copied here; they are listed in `third-party-skills.txt`. MCP servers are listed in `mcp-servers.txt` (Claude Code) and `config/opencode/opencode.jsonc` (OpenCode).
- Keep `install.sh` identical in both repos.
- After touching `skills/`, check with `npx skills add . --list`.
