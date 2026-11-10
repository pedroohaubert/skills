# Code

- Write the minimum that solves the request. Add abstraction, configuration, or error handling only when the task needs it.
- Every changed line traces to the request. Leave neighbouring code as it is and mention unrelated problems instead of fixing them.
- Follow the repo's existing style, components, and patterns before creating new ones or adding a dependency.
- A mistake that repeats becomes structure: a type, lint, test, or script, ahead of more prose.

## Playbooks

When the task matches a row, read that playbook and follow its steps.

| Case | Read |
|---|---|
| Something behaves wrong: a bug, an error, a regression | `~/.agents/playbooks/bug-fix.md` |
| Proving a change works, or the repo has no repeatable way to prove it | `~/.agents/playbooks/verification.md` |
