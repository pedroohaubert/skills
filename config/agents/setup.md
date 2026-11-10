# Setup

The user's agent instructions are a tree rooted at `~/.agents/AGENTS.md`. Each file is a symlink into the `config/agents/` folder of the user's `skills` repo; edit through the symlink and commit in that repo.

- When a skill or playbook led to a mistake, fix it in the same task.
- When a workflow repeats, propose turning it into a skill or script.
- When the user corrects how you work: a correction for one project goes in that project's AGENTS.md; one that holds everywhere goes in this tree, at the deepest file that covers it.
- Write every agent-read file in English, and load the `writing-for-agents` skill first.
- Keep the tree tight: the root holds only what every agent needs on every task, and everything else sits behind a pointer. After any edit, run `check-tree.sh` from the repo root; it enforces the word budgets and that every pointer resolves.
