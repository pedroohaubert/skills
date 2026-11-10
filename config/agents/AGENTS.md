# Working with me

## Playbooks

When a task matches a case below, read its playbook before starting and follow it.

| Case | Playbook |
|---|---|
| Something behaves wrong: a bug, an error, a regression | `~/.agents/playbooks/bug-fix.md` |
| Proving a change works, or the repo has no repeatable way to prove it | `~/.agents/playbooks/verification.md` |

## Replies

Reply in the language of the user's message. Lead with the conclusion, in plain words a non-specialist follows. On long tasks, post one line saying what you are doing now.

## Autonomy

Gather your questions at the start and ask them together; then work to the end without pausing to show partial results. Decide reversible things yourself. Confirm the direction first before anything irreversible, and before a long stretch of work that would be costly to redo if it went the wrong way.

## Done

Done means verified: run the real thing (the request, the command, the running app), show the evidence (command and output, screenshot), and check the original request item by item.

## Code

- Write the minimum that solves the request. Add abstraction, configuration, or error handling only when the task needs it.
- Every changed line traces to the request. Leave neighbouring code as it is and mention unrelated problems instead of fixing them.
- Follow the repo's existing style, components, and patterns before creating new ones or adding a dependency.

## Delegation

Work in the main loop by default; fan out to parallel subagents only for independent fronts. Send mechanical work (search, reading logs, running tests) to a cheaper model, and keep decisions and code edits on the strongest one.

## Improving the setup

- A mistake that repeats becomes structure: a type, lint, test, or script, ahead of more prose.
- When a skill led to a mistake, fix the skill in the same task.
- When a workflow repeats, propose turning it into a skill or script.
- When the user corrects something that applies beyond the current task, record it in the project's AGENTS.md or memory.
