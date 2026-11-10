# AGENTS.md

Public repo with Pedro's skills and agent setup, installable with `npx skills add pedroohaubert/skills`. A private twin, `pedroohaubert/skills-private`, has the same layout and the same `install.sh`.

- Public holds what is generic and serves software development. Personal or work skills, dotfiles, and anything naming a project path, client, colleague, internal URL, corporate email, or credential go to the private repo.
- Every file an agent reads (skills, AGENTS.md, playbooks, config) is written in English. Human-facing docs (README, referencias.md) stay in Portuguese.
- Load the `writing-for-agents` skill before writing or editing any of those files.
- Skills live in `skills/<name>/SKILL.md`, with `name` matching the folder. `SKILL.md` exists only under `skills/`: skills.sh scans the whole repo and installs any it finds.
- `config/<target>/` mirrors a machine directory: `agents` → `~/.agents`, `claude` → `~/.claude`, `opencode` → `~/.config/opencode`. Agent-neutral material goes in `agents`; config for one agent goes in its own folder. A new target needs a line in `agent_dir` in `install.sh`.
- `config/agents/AGENTS.md` stays short: general rules plus a table of cases pointing at `config/agents/playbooks/`. Details for one case go in its playbook. Claude Code reaches it through `config/claude/CLAUDE.md` (an `@` import); OpenCode through the `config/opencode/AGENTS.md` symlink.
- `referencias.md` records what was studied and what we took from each source. Read it before proposing a setup change; add any article, post, or repo the user sends.
- Third-party skills are not copied here.
- Keep `install.sh` identical in both repos.
- After touching `skills/`, check with `npx skills add . --list`.
