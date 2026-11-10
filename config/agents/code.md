# Code

- Write the minimum that solves the request. Add abstraction, configuration, or error handling only when the task needs it.
- Every changed line traces to the request. Leave neighbouring code as it is and mention unrelated problems instead of fixing them.
- Follow the repo's existing style, components, and patterns before creating new ones or adding a dependency.
- A mistake that repeats becomes structure: a type, lint, test, or script, ahead of more prose. With pstack installed, its `correct` skill does this for a whole repo.

## Playbooks

When the task matches a row, read that playbook and follow its steps. A small, clear change needs none.

| Case | Read |
|---|---|
| Understanding code before changing it; a question about how or why | `~/.agents/playbooks/investigation.md` |
| Something behaves wrong: a bug, an error, a regression | `~/.agents/playbooks/bug-fix.md` |
| Adding behavior | `~/.agents/playbooks/feature.md` |
| Changing structure while keeping behavior | `~/.agents/playbooks/refactor.md` |
| Proving a change works, or the repo has no repeatable way to prove it | `~/.agents/playbooks/verification.md` |
| Opening a pull request | `~/.agents/playbooks/pull-request.md` |

## pstack

When pstack is installed, its skills are tools the playbooks name at the step that needs them; `tdd` fits any step that writes a test first. For a design call (how simple, where state lives, what a type should allow), read the one `principle-*` skill that names the decision. Its heavy modes (`poteto-mode`, `arena`, `swarm`, `interrogate`) run only when the user types them.
