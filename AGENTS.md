# AGENTS.md

Public repo with Pedro's skills and agent setup, installable with `npx skills add pedroohaubert/skills`. A private twin, `pedroohaubert/skills-private`, has the same layout and the same `install.sh`.

- Public holds what is generic and serves software development. Personal or work skills, dotfiles, and anything naming a project path, client, colleague, internal URL, corporate email, or credential go to the private repo.
- Everything in this repo is written in English, docs included. The only Portuguese is what teaches the `writing` skill to write Portuguese: its voice profile, examples, and phrase lists (`skills/writing/voice.md`, `tells.md`, `public.md`, `message.md`, `cases/`).
- Load the `writing-for-agents` skill before writing or editing any of those files.
- Skills live in `skills/<name>/SKILL.md`, with `name` matching the folder. `SKILL.md` exists only under `skills/`: skills.sh scans the whole repo and installs any it finds.
- `config/<target>/` mirrors a machine directory: `agents` → `~/.agents`, `claude` → `~/.claude`, `opencode` → `~/.config/opencode`, `pi` → `~/.pi/agent`. Agent-neutral material goes in `agents`; config for one agent goes in its own folder. A new target needs a line in `agent_dir` in `install.sh`.
- `config/agents/` is an instruction tree: `AGENTS.md` is the root every agent reads on every task (replies, autonomy, done, delegation, plus a table of branches); branches are read only when their case fires: `code.md` with its topic files under `code/`, `learning.md` (how corrections and approvals become lessons; the optional learning loop), `setup.md`, and `playbooks/`. Point at them with plain `~/.agents/...` paths, never `@` imports, which load eagerly. Run `./check-tree.sh` after any edit.
- Claude Code reaches the root through `config/claude/CLAUDE.md` (an `@` import); OpenCode and Pi through the `config/opencode/AGENTS.md` and `config/pi/AGENTS.md` symlinks. Each loads it alongside a project's own instructions.
- `PROXIMOS-PASSOS.md` lists what is pending; read it when resuming work here and update it when something closes or opens.
- `referencias.md` records what was studied and what we took from each source. Read it before proposing a setup change; add any article, post, or repo the user sends.
- `skills/design/` is the design branch of the tree: a router (`SKILL.md`) over the user's own files, Emil Kowalski's skills vendored under `emil/`, and kosta4a's tactile-design vendored under `tactile/` (both MIT). Never edit `emil/` or `tactile/` by hand; update them with `skills/design/sync-emil.sh` and `skills/design/sync-tactile.sh`.
- `skills/writing/humanizer/` is blader's humanizer skill vendored whole (MIT); update it with `skills/writing/sync-humanizer.sh` and keep our adaptations in `skills/writing/tells.md`.
- Other third-party skills are not copied here; they are listed in `third-party-skills.txt`. MCP servers are listed in `mcp-servers.txt` (Claude Code) and `config/opencode/opencode.jsonc` (OpenCode).
- Keep `install.sh` and `.githooks/` identical in both repos.
- Commits apply themselves: the `post-commit` hook in `.githooks/` (turned on by `./install.sh hooks`) relinks `config/` or `dotfiles/` and reinstalls `skills/` when a commit touches them. If it prints a failure, run that `./install.sh` mode by hand.
- After touching `skills/`, check with `npx skills add . --list`.
