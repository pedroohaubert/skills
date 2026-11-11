# Verification

A check you can rerun beats an explanation. The goal is that proving a change works is a step any agent can execute in this repo, without a setup conversation.

1. **Name the check before editing.** Match it to the change:
   - CLI: run the real command.
   - API or integration: send the real request.
   - UI: walk the changed flow in the running app and capture screenshots.
   - Parser, import, or migration: replay a saved input.
   - Performance: compare before and after profiles over repeated runs.

   Done when the check is written down and you know how to run it.
2. **Use the project's verification skill** (`verify-<app>` or similar) when it exists. When proving behavior takes the same manual steps a second time, create one: with pstack, run `/create-verification-skill`; otherwise write a skill with Launch, Drive, Evidence, and Cleanup sections, and prove it once end to end before relying on it.
3. **Leave the user's running servers up.** Run your own instance on another port, from a separate copy when two instances would share a build cache. Start and stop long-running servers as `~/.agents/code/shell.md` says.
4. **Run the check and capture evidence:** commands with their output, screenshots, the failing then passing test. A check that could not run is reported as inconclusive, with the reason.
5. **Keep verification current.** When the change alters behavior a verification skill covers, update that skill in the same change (pstack: `/maintain-verification-skill`).
6. **Propose formal verification** when the change touches a promise tests rarely reach and a break is costly: concurrency, retries, locks, state machines, parsers. With pstack: `/create-formal-verification-skill`, and `/maintain-formal-verification-skill` after refactors of the covered code.

Done when every check named in step 1 ran and its evidence is in the reply.
