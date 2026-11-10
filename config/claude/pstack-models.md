# pstack model configuration

Per-role model overrides for pstack skills. Each pstack SKILL.md names its defaults in a Models section; the values here override those defaults. Delete a line to fall back to the skill default. A value of `inherit-parent` or `auto` runs that role on the parent session's model (the `Agent` call omits `model`); an alias entry in a panel list still counts toward that panel's fan-out. A model may carry a reasoning effort, as in `opus @high` (levels: low, medium, high, xhigh, max); the role then runs through the pstack effort agent of that level, each entry of a panel list on its own. `default effort` sets the level for a value without one; `session` keeps the parent session's effort. `session hook: off` stops the Claude Code or Codex SessionStart hook, or the pstack Pi extension, from injecting the poteto-mode mandate; any other value, or no line, leaves it on.

feature, refactoring: opus @high
bug-fix: opus @high
perf-issue: opus @high
hillclimb: opus @medium
judgment and prose: opus @high
strongest judgment: opus @high
how explorer: sonnet @medium
how explainer: opus @high
why investigators: sonnet @medium
why synthesizer: opus @high
reflect tooling: sonnet @medium
reflect judgment, divergent, synthesizer: opus @high
arena runners: opus @high, sonnet @high, haiku @max
arena cross-judge pool: sonnet @high, opus @high
swarm workers: sonnet @medium
architect runners: opus @high
interrogate reviewers: opus @high

default effort: session
session hook: off
