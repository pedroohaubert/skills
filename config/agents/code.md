# Code

- Write the minimum that solves the request. Add abstraction, configuration, or error handling only when the task needs it.
- Every changed line traces to the request. Leave neighbouring code as it is and mention unrelated problems instead of fixing them.
- Follow the repo's existing style, components, and patterns before creating new ones or adding a dependency.
- A mistake that repeats becomes structure: a type, lint, test, or script, ahead of more prose.

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

## Before you write code

Reading these is part of the task, every time you write or change code beyond a one-line edit. They are what makes the result read like a careful engineer wrote it.

1. **Ponytail.** When the Ponytail plugin is installed, follow its ruleset: look at what the repo and the platform already give you, write only what the task needs, and keep validation, error handling, security, and accessibility intact. Use its `ponytail-review` skill to review a change and `ponytail-audit` to rank what to fix in a whole repo.
2. **pstack principles.** When pstack is installed, read the `principle-*` skills that match the work before the first edit, in full:

   | Writing | Read |
   |---|---|
   | Any code | `principle-laziness-protocol`, `principle-minimize-reader-load` |
   | New logic or state | `principle-foundational-thinking`, `principle-model-the-domain` |
   | Types or a function signature | `principle-type-system-discipline` |
   | Validation, error handling, an adapter | `principle-boundary-discipline` |
   | Adding to or reshaping existing code | `principle-subtract-before-you-add`, `principle-redesign-from-first-principles` |
   | Retries, commands, lifecycle steps | `principle-make-operations-idempotent` |
   | A fix | `principle-fix-root-causes` |
   | Tests | `principle-test-behavior-not-implementation` |
   | Declaring the work done | `principle-prove-it-works` |

   In the reply, name each principle that changed a decision and what it changed.

## pstack tools

The playbooks name pstack's skills at the step that needs them; `tdd` fits any step that writes a test first, and `correct` turns a repeated mistake into a check. Its heavy modes (`poteto-mode`, `arena`, `swarm`, `interrogate`) run only when the user types them.
