# skills

How I work with coding agents: the skills I wrote or adapted, and the config for Claude Code, OpenCode, and Pi, kept as neutral as possible.

## Install only the skills

```bash
npx skills add pedroohaubert/skills          # pick which ones
npx skills add pedroohaubert/skills -g --all # all of them, global, all agents
```

This repo has two skills:

| Skill | What it does |
|---|---|
| `design` | Router for design and UI: process (flow, precedent, layout, verification), an opinionated composition guide, a catalog of proven app patterns to borrow, preferred libraries, typography, and Emil Kowalski's skills and kosta4a's tactile-design as subfiles |
| `writing` | Writes, improves, or corrects text for people, in my voice and free of AI tells: messages for Teams, Slack, or email, questions for the business, posts, articles, bios, titles. The final text goes to the clipboard |
| `retro` | End-of-session retrospective (`/retro`): turns the user's corrections, approvals, and the agent's discoveries into a check in the project repo (via pstack `correct`), a lesson in the global setup, or a memory, always shown and approved first |

## Third-party skills and plugins

These are not copied here. `install.sh` installs them from `third-party-skills.txt` and `claude-plugins.txt`:

- **pstack** (plugin, Claude Code and OpenCode): a working method with principles, playbooks, and verification. It ships `pstack-technical-writing`, which covers documentation, PRs, and commit messages. For text meant for a person, use `writing`.
- **Ponytail** (plugin, Claude Code and OpenCode): makes the agent write the smallest code that solves the task.
- **Matt Pocock:** `writing-for-agents` (for writing skills and agent instructions) and `handoff`.
- **Be Ambitious:** `be-ambitious`, to turn a request into a deeper version of itself.

## Install with an agent

Copy the text below and paste it into a coding agent (Claude Code or OpenCode), in an empty folder:

```text
I want to install the agent setup from the repository https://github.com/pedroohaubert/skills on my machine. Follow these steps and tell me about each one:

1. Check that I have git, node, and npx. If any is missing, stop and tell me what to install.
2. Clone the repository into ~/skills. If the folder already exists, don't delete anything: ask me first.
3. Inside ~/skills, run ./install.sh. It creates links in ~/.agents, ~/.claude, ~/.config/opencode, and ~/.pi/agent, and keeps everything that already existed there with the suffix .bak.<date>. If the `claude` or `opencode` command doesn't exist, skip the plugin and MCP steps and tell me.
4. Read config/opencode/opencode.jsonc. The default model is opencode-go/deepseek-v4.1-flash. If I don't have that plan, ask me which model to use and change it before going on.
5. Verify the install: `ls -la ~/.agents ~/.claude/CLAUDE.md ~/.config/opencode/opencode.jsonc ~/.pi/agent/AGENTS.md` (the links must point into ~/skills), `./check-tree.sh` must pass, and `npx skills add ~/skills --list` must list the skills.
6. Show me a summary: what got linked, what got saved in .bak, and any error. Don't delete or change files other than the ones install.sh creates.
```

The agent does the install and shows you what changed. If something goes wrong, the old files are still saved with the `.bak` suffix.

## Install by hand

```bash
git clone https://github.com/pedroohaubert/skills ~/skills
cd ~/skills && ./install.sh   # or: config | skills | third-party | plugins | mcp
```

`config/<target>/` mirrors a machine directory and becomes symlinks there: `agents` → `~/.agents` (instructions any agent reads), `claude` → `~/.claude`, `opencode` → `~/.config/opencode`, `pi` → `~/.pi/agent`. Pi reads skills from `~/.agents/skills`, where skills.sh installs them. Config that belongs to one agent stays in that agent's folder.

For OpenCode, this repo's `opencode.jsonc` loads the plugins (Ponytail and pstack) and the MCP servers. For Claude Code, `plugins` installs pstack and Ponytail from `claude-plugins.txt`, and `mcp` registers the servers listed in `mcp-servers.txt`.

| MCP server | What it does |
|---|---|
| `shoogle` | Search for components across shadcn registries. |
| `parallel` | Web search and page extraction. Signing in adds research, higher rate limits, and monthly credits. |
| `exa-hosted` | Search and fetch pages through Exa's hosted server. |
| `inspo` | Screenshot archive of real production sites, with palettes, fonts and page structure. |
| `kage` | Design library of real product screens, with ready-to-paste prompts and extracted components. |
| `onepagelove` | One-page website and section references since 2008, with hero copy and typefaces. |

All of them work without an account or API key.

The sources behind the setup are in [referencias.md](referencias.md). The model choice for each kind of task is in [modelos.md](modelos.md). What is still to do is in [PROXIMOS-PASSOS.md](PROXIMOS-PASSOS.md).

Personal material (work skills, terminal dotfiles) lives in a private repo with the same layout and the same `install.sh`.
