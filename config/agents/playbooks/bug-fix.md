# Bug fix

1. **Reproduce.** Make the bug happen on demand: a failing test, a request, a script, or steps in the running app. Done when the repro runs red.
2. **Find the cause.** Trace from the repro to the root cause, using logs, data, and the code path. Done when you can say why it fails, and the explanation predicts the repro's output.
3. **Fix at the cause.** Change the code where the cause lives, not where the symptom shows. Done when the repro runs green and the surrounding checks still pass.
4. **Keep the repro** as a regression test when the repo has tests.
5. **Close the class.** If the same kind of bug can come back, propose the type, lint, or test that would catch it.

Report the repro, the cause, the fix, and the red-then-green evidence, following `~/.agents/playbooks/verification.md`.
