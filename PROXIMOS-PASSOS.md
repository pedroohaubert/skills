# Next steps

State as of 2026-11-10 (night). The instruction tree is active on this machine (`./install.sh config`), with the `design` and `writing` skills, the pstack and Ponytail plugins (Claude Code and OpenCode; on OpenCode, pstack comes from the plugin `github:michael-denyer/pstack-claude#main`), and the model config in `modelos.md`. The OpenCode default model was confirmed in a fresh session: DeepSeek V4.1 Flash.

Done since: the `design` skill became opinionated (`composition.md`, `precedents.md`, `verify.md`, lessons from a long UI review plus Lessons of Design); the tree budgets went up (root 800 words, nodes 2000); OpenCode no longer gets the pstack poteto-mode mandate (`config/opencode/pstack-models.md`, checked with a with/without probe). The OpenCode Go weekly quota ran out on 2026-11-10; free models (`opencode/iceman-free`) still answer.

Also done (2026-11-11): `learning.md` in the tree is the single home for turning corrections, approvals and discoveries into lessons (signals, the bar, lesson format, routing, ask first, `lesson(<area>):` commits as the ledger), with an optional loop any agent may run; the `retro` skill (user-invoked only) is the thorough end-of-session pass. Both were blind-tested, including control runs where nothing should be proposed.

## To do

1. **Grow the code part (started 2026-11-10).** Decided with the user: no skill to invoke; the routing stays in the tree, which agents read on their own when coding. `code.md` now opens with "the repo's way wins" (opinions shape new code inside the repo's shape and never justify a refactor), the four-question bar (solves it, simplest, readable, no new trouble), "find the nearest example first", and a topic table pointing at `code/writing.md`, `tests.md`, `typescript.md`, `python.md`, `sql.md`, `shell.md`. Test defaults chosen by the user: pure rules with unit tests, red test first for bugs, browser tests only for critical flows; comments only for the why. Library defaults were left to the agent under the simplicity bar. Next: review the topic files with the user and add a review/PR file if the blind tests show a gap.
2. **Blind-test the code playbooks** (feature, refactor, investigation, pull-request), as was done for `writing`. The PR one depends most on taste.
3. **Advisor:** `advisorModel` points at Fable. When Fable leaves the plan, turn it off with `/advisor`.
4. **Muse Ember:** add it to `modelos.md` and to OpenCode when it joins the Go plan (still absent from `opencode models` on 2026-11-10).
5. **Stalled private skills:** `apontamento-horas` and `limpeza-mac` are still in Portuguese and don't follow the new standard.
6. **Rotate credentials** that appear in plain text in the prompt history and in `~/.codex/config.toml`.
7. **Design and code together.** The user wants to talk through how the `design` skill and `code.md` divide UI work ("já falaremos mais sobre isso"); today the root sends UI work to `design` first, then `code.md`.
8. **Push** the local commits of the design rework when the user approves.

## How to resume

Read `AGENTS.md` (repo rules), `referencias.md` (what each decision rests on), and this file. Working rule: ask before writing, test a skill with a fresh agent before calling it done, and run `./check-tree.sh` after changing `config/agents/`.
