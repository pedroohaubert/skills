# Models

Which model for what. Sources: [Which Claude model should you build with](https://claude.dev/blog/which-claude-model-should-you-build-with/) and the OpenCode Go limits (see `referencias.md`).

## Claude Code

| Use | Model | How it is configured |
|---|---|---|
| Default: everyday engineering, debugging, features | Opus 5.5 at medium | `model: opus` and `effortLevel: medium` in `~/.claude/settings.json` |
| Well-bounded task, text, repeated review | Sonnet 5.5 at medium | `/model sonnet` when you want it |
| Searching code and documentation | Haiku 5.5 | subagent `Explore` in `config/claude/agents/` |
| Running tests, build, lint, and reading logs | Haiku 5.5 | subagent `runner` in `config/claude/agents/` |
| Large migration, architecture, long unattended work | Fable 5.2 at medium | `/model fable`, while the plan gives access |

Before raising effort, give the agent a way to verify itself. Above `high`, the bigger model at a lower effort is worth more. Switch models at a natural pause: the first reply on the new model pays the cache for the whole conversation.

The advisor (`advisorModel`) is set to Fable. When Fable leaves the plan, turn it off with `/advisor`.

## OpenCode (smaller tasks, Go plan)

| Use | Model | Why |
|---|---|---|
| Default: debugging, multi-file edits, search | `opencode-go/deepseek-v4.1-flash` | US$ 100 monthly cap on Go, the largest of the three, and fast |
| UI, text, small edits that must come out ready | `opencode-go/claude-haiku-5-5` | Best score on merge-ready code and on UI; its cap is US$ 15 a month, so use it on purpose |
| Many tool-call steps | Muse Ember, once it is on Go | Built for tool calls; today it exists only on Meta's API |

The default model is set in `config/opencode/opencode.jsonc`. Open issue: in a test, `opencode run` ignored that key and opened a free model; with `-m opencode-go/deepseek-v4.1-flash` it works.
