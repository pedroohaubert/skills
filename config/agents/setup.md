# Setup

The user's agent instructions are a tree rooted at `~/.agents/AGENTS.md`. Each file is a symlink into the `config/agents/` folder of the user's `skills` repo; edit through the symlink and commit in that repo. The repo's `post-commit` hook re-applies each commit to this machine (relinks config, reinstalls skills), so a change is live once it is committed; push when the user approves.

- When a skill or playbook led to a mistake, fix it in the same task.
- When a workflow repeats, propose turning it into a skill or script.
- When the user corrects how you work: a correction for one project goes in that project's AGENTS.md; one that holds everywhere goes in this tree, at the deepest file that covers it.
- Write every agent-read file in English, and load the `writing-for-agents` skill first.
- The root holds what every agent needs on every task; everything else sits behind a pointer. Write lessons down in full, with the reason and an example: the budgets are generous so knowledge is recorded, not trimmed. After any edit, run `check-tree.sh` from the repo root; it checks the budgets and that every pointer resolves.
