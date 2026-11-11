---
name: retro
description: End-of-session retrospective that turns the user's corrections, approvals, and the agent's own discoveries into durable improvements, always shown and approved first.
disable-model-invocation: true
---

# Retro

Run at the end of a working session. The session's raw material is the user's corrections, what they approved, and what you learned the hard way. Turn each into the change that makes the next session start ahead: a check in the project repo, a lesson in the user's global setup, or a fact in memory. Nothing outside memory is written before the user approves it.

This is the deep version of the small loop in `~/.agents/setup.md`. Depth over breadth: three lessons that change behavior beat fifteen that restate defaults.

## 1. Harvest

Read the whole session, not only its end. When it is long, find the transcript with pstack's `reflect` finder (`skills/reflect/scripts/find-transcript.mjs` under the installed plugin) and read the user's messages in order. Collect every **signal**, each with the user's words or the evidence quoted:

- **Correction:** the user rejected, redirected, or called something wrong or ugly ("isso ficou feio", "não foi isso que pedi", "por que demorou tanto"). Note what you had done and what they wanted instead.
- **Approval:** the user kept, praised, or built on a non-obvious choice ("ficou interessante", "isso está show", "boa"). Note what made it work; approvals are as valuable as corrections and easier to lose.
- **Discovery:** something you believed that turned out false, a cause you blamed before proving it, a tool or path that failed, a step you repeated by hand.
- **Decision:** a rule the user settled ("a aba padrão é Todos", "homolog e produção ficam separados").

Done when every user message that corrected, approved, or decided something maps to a signal, and every signal has its quote or evidence.

## 2. Turn signals into lessons

Group signals that share a cause into one lesson. For each lesson write: what happened, why it failed or worked, the rule going forward, and one example. `lessons.md` has the format and worked examples.

Before routing, search the likely targets (the `~/.agents/` tree, the skill's reference files, the project's AGENTS.md and docs, agent memory) for the lesson. Then sort it:

- **Already recorded and followed, or enforced by a check:** drop it, naming where it lives. A check that exists but has not reached the main branch yet counts as recorded; name the pull request.
- **Recorded, but skipped this session:** a repeat. Prose did not hold, so route it as a check or structure (pstack's `correct`), not as more prose.
- **Recorded, but vague enough that it did not guide you:** sharpen that line instead of adding a new one.
- **Will not recur:** a one-off typo, a misunderstanding already cleared, a permission the user gave once for one action. Drop it.
- **New:** route it in step 3.

## 3. Route each lesson

| The lesson is about | Goes to | How |
|---|---|---|
| This project: its code, workflow, tooling, data, conventions, recurring breakage | The project repo | Invoke pstack's `correct` skill on the repo with these lessons as input. It prefers architecture, types, a check, or a test over prose, and proves each check on a real past mistake. The repo's own branch and PR flow applies. |
| A fact about this project worth remembering across sessions (a decision, a state, who owns what) | Agent memory | Write or update the memory file directly; this needs no approval. |
| How to work, on any project: replies, autonomy, verification, delegation, code craft, UI composition, writing | The user's skills repo | The behavior tree is `~/.agents/` (files are symlinks into the repo; `readlink ~/.agents/AGENTS.md` shows where). Put the lesson in the deepest file whose case it sharpens: a playbook step (`playbooks/bug-fix.md` for diagnosis), a topic file (`code/tests.md`), `setup.md` for how instructions evolve, and `AGENTS.md` only for what every task needs. Craft knowledge goes into the matching skill's reference file (for UI, the `design` skill's `composition.md` or `precedents.md`). Load `writing-for-agents` before editing. |
| A preference of the user that holds everywhere (taste, tone, how they want to be asked) | The skills repo, same as above | Written as a rule with its reason, never as "the user likes X" alone. |

Keep project specifics out of the global setup: branch names, file paths, colleague names, this repo's release process, and errors only this codebase produces stay in the project. When a project lesson has a general core, write the general core globally, anonymized, and the specifics in the project.

## 4. Show the plan and ask

Present one table, no edits made yet:

| # | Lesson (one line) | Signal (quote) | Target file | Change (summary) | Kind |
|---|---|---|---|---|---|

Kind is `check` (code that fails), `structure`, `rule` (prose), or `memory`. Under the table, show the exact text of every prose change and the shape of every check, then the dropped signals, one line each with the reason from step 2 (where it is already recorded, the pending pull request, or why it will not recur). Then ask with a multi-select question which rows to apply; the user can also redirect a row's target. Memory rows are applied without asking, and listed so the user can veto them.

## 5. Apply and prove

- Apply only the approved rows.
- Every new check fails on the real past mistake before it passes on the fixed code; show both runs.
- After a substantial change to an instruction file or skill, run one blind test: a fresh subagent gets a task that exercises the lesson and reports which files it read and what it would do. A lesson the agent does not find or does not follow is not done.
- Commit in the skills repo; its post-commit hook re-applies the change to this machine. Push when the user approves. Project repo changes follow that repo's flow.

## 6. Report

Short, in the user's language: each applied lesson with where it lives and what enforces it (a check, a test, or prose only), the rows dropped and why, and anything left that only the user can decide.

Done when every signal from step 1 is applied, dropped with a reason, or waiting on the user, and the report says which.
