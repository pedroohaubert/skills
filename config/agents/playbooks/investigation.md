# Investigation

Read-only. The result is an answer the user can trust, with no code changed.

1. **Restate the question** in one line, so the answer has a target.
2. **Trace the real code,** from the entry point through the flow to the data. For why something is the way it is, read the history: `git log`, `git blame`, linked issues. With pstack installed, `how` covers the first and `why` the second.
3. **Answer** in plain words: what it does, how it works, where each part lives, and the surprises. For a choice between options, give a table of what each costs and one recommendation.
4. **Point forward.** If the answer leads to a change, say which playbook comes next and wait for the user.

Done when every claim cites a file and line, or a command you ran with its output.
