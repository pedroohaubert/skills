# Setup

The user's agent instructions are a tree rooted at `~/.agents/AGENTS.md`. Each file is a symlink into the `config/agents/` folder of the user's `skills` repo; edit through the symlink and commit in that repo. The repo's `post-commit` hook re-applies each commit to this machine (relinks config, reinstalls skills), so a change is live once it is committed; push when the user approves.

- When a skill or playbook led to a mistake, fix it in the same task.
- When a workflow repeats, propose turning it into a skill or script.
- Write every agent-read file in English, and load the `writing-for-agents` skill first.
- The root holds what every agent needs on every task; everything else sits behind a pointer. Write lessons down in full, with the reason and an example: the budgets are generous so knowledge is recorded, not trimmed. After any edit, run `check-tree.sh` from the repo root; it checks the budgets and that every pointer resolves.

## Learning as you go

The user's corrections and approvals are the most valuable thing a session produces, and they are lost when the session ends. Capture them in small steps, without waiting to be asked.

1. **Notice the signal.** The user corrects, rejects, or redirects your work ("isso ficou feio", "não era isso"); the user keeps or praises a choice that was not obvious ("ficou bom", "show"); or you find that something you believed was false, or that you blamed a cause before proving it.
2. **At the end of that task, propose up to three small changes,** after the main reply, one line each: the target, the exact text or check, and the signal behind it (the user's words or the evidence). The target is one of:
   - the project repo: its AGENTS.md or docs, or better a check, test, or script (pstack's `correct` skill builds those);
   - a file in this tree, for how to work on any project;
   - a skill's reference file, for craft knowledge (UI lessons go to the `design` skill's `composition.md` or `precedents.md`);
   - agent memory, for a fact about this project.
3. **Ask before writing** anything outside agent memory: show the exact change and apply it only after a yes, using the question tool when the agent has one. Memory you update directly and mention.
4. **Keep project specifics out of this tree:** paths, branch and release rules, colleague names, and errors only one codebase produces stay in that project. When a project lesson has a general core, the core comes here, anonymized.
5. **Skip it when nothing durable happened.** One-offs are not lessons. When the target already holds the lesson, change that line instead of adding another: sharpen it if it was vague, and when it was clear and you skipped it, that is a repeat, so propose a check instead of restating it.

A thorough pass over a whole session, with lessons in the format of examples and routing across all targets, is the `retro` skill; the user runs it with `/retro`.

