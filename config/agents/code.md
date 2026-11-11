# Code

Read this before writing or changing code. It holds the stance; the topic files and playbooks below hold the detail, read only when their row fires.

## The repo's way wins

These are global opinions for code the user owns, across many repos. Inside a repo, its own conventions come first: its AGENTS.md and docs, its test framework and test style, its architecture, its libraries, its naming language, and the file next to the one you are editing. Use the opinions here to shape the code you add *within* that shape, and as the default only where the repo has not decided.

The rules in this tree come in two kinds, and they yield differently:

- **Conventions** (framework, folder layout, architecture, libraries, naming, formatting, test runner and file placement): the repo wins, always. Copy what is there, even where this tree would choose otherwise.
- **The quality floor** (tests check behavior rather than internals, data is validated where it enters, errors are never swallowed, no secrets in code, accessible UI, no second source of truth): it applies to the code you write, even when the neighbouring code falls below it. You write the new test about behavior inside the repo's runner and layout; you do not rewrite the neighbours to match.

An opinion here is never a reason to restructure what exists. When the repo does something differently than this tree would, follow the repo and, if it matters, mention the difference in one line of the reply. Refactors happen when the user asks for one.

## The bar

Every change is judged by the same four questions, in this order:

1. **Does it solve the actual problem?** All of it, including the callers, tests, and data the change must reach.
2. **Is it the simplest thing that does?** The fewest new concepts, files, dependencies, and layers. A dependency or abstraction must pay for itself today, not someday.
3. **Can the next reader follow it** from one file, without holding hidden state in their head?
4. **Does it stay out of new trouble?** No new way for state to drift, no second source of truth, no trap the next change will fall into.

Practical consequences:

- Write the minimum that solves the request. Add abstraction, configuration, or error handling only when the task needs it.
- Every changed line traces to the request. Leave neighbouring code as it is and mention unrelated problems instead of fixing them.
- A mistake that repeats becomes structure: a type, lint, test, or script, ahead of more prose.

## Find the nearest example first

Before writing a component, hook, service, query, test, or script, search the repo for one that already does the same job, and copy its shape: file location, naming, error handling, test style. Extend the existing piece when it nearly fits; write a new one only when none does. Agents that skip this step invent a second way of doing something the repo already does, and the second way is what the next agent copies.

## Topics

| Writing | Read |
|---|---|
| Any code: names, functions, files, state, errors, comments, abstraction | `~/.agents/code/writing.md` |
| A test, or code that should have one | `~/.agents/code/tests.md` |
| TypeScript, React, or Next | `~/.agents/code/typescript.md` |
| Python, FastAPI, or SQLAlchemy | `~/.agents/code/python.md` |
| SQL, a migration, a seed, or a data fix | `~/.agents/code/sql.md` |
| A shell script, a launcher, setup, or CI step | `~/.agents/code/shell.md` |

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
