# Next steps

State as of 2026-11-10 (night). The instruction tree is active on this machine (`./install.sh config`), with the `design` and `writing` skills, the pstack and Ponytail plugins (Claude Code and OpenCode; on OpenCode, pstack comes from the plugin `github:michael-denyer/pstack-claude#main`), and the model config in `modelos.md`. The OpenCode default model was confirmed in a fresh session: DeepSeek V4.1 Flash.

Done since: the `design` skill became opinionated (`composition.md`, `precedents.md`, `verify.md`, lessons from a long UI review plus Lessons of Design); the tree budgets went up (root 800 words, nodes 2000); OpenCode no longer gets the pstack poteto-mode mandate (`config/opencode/pstack-models.md`, checked with a with/without probe). The OpenCode Go weekly quota ran out on 2026-11-10; free models (`opencode/iceman-free`) still answer.

## To do

1. **Grow the code part.** Today `code.md` and the playbooks are small files. The idea is to move part of it into our own, more opinionated skills, as was done with `design` and `writing`: how the code should be written, structured, and reviewed, with examples. The pstack principles and Ponytail are the base; my own layer on top is still missing.
2. **Blind-test the code playbooks** (feature, refactor, investigation, pull-request), as was done for `writing`. The PR one depends most on taste.
3. **Advisor:** `advisorModel` points at Fable. When Fable leaves the plan, turn it off with `/advisor`.
4. **Muse Ember:** add it to `modelos.md` and to OpenCode when it joins the Go plan (still absent from `opencode models` on 2026-11-10).
5. **Stalled private skills:** `apontamento-horas` and `limpeza-mac` are still in Portuguese and don't follow the new standard.
6. **Rotate credentials** that appear in plain text in the prompt history and in `~/.codex/config.toml`.
7. **Design and code together.** The user wants to talk through how the `design` skill and `code.md` divide UI work ("já falaremos mais sobre isso"); today the root sends UI work to `design` first, then `code.md`.
8. **Push** the local commits of the design rework when the user approves.

## How to resume

Read `AGENTS.md` (repo rules), `referencias.md` (what each decision rests on), and this file. Working rule: ask before writing, test a skill with a fresh agent before calling it done, and run `./check-tree.sh` after changing `config/agents/`.
