# Pull request

Open a pull request when the user asks for one.

1. **Follow the repo's process.** The project's AGENTS.md or docs name the base branch, branch naming, and tool (`gh`, `az`, another). Without one: branch from the default branch as `type/short-name`.
2. **Review your own diff.** Only files that belong to the change, with debug code, stray files, and secrets out. For a diff you do not fully trust, use pstack's `blast-radius` and `thermo-nuclear-review` when installed.
3. **Run the repo's checks** and see them pass.
4. **Commit** in small, ordered commits. Each message says what changed and why.
5. **Describe.** Title in the repo's style. Body in the language the team uses, at the level of behavior: what changed for the person using the system, why this approach, what it leaves out, and how it was verified. A reviewer should understand the impact without reading the diff.
6. **Open it and give the user the URL.**

Review comments from automated reviewers: judge each on its merits. Fix real problems; dismiss noise with a concrete reason, and stop there.

Done when the pull request is open, its checks are running or green, and the user has the URL.
