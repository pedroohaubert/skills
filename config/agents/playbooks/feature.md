# Feature

1. **Understand the area.** Read the code path the feature touches, from entry point to data. For an unfamiliar subsystem, use pstack's `how` skill when installed. Done when you can name the files and the data shape the feature changes.
2. **Define done.** Write down the checks that will prove the feature works, following `~/.agents/playbooks/verification.md`, before writing code.
3. **Settle the shape.** Name the data shape first, then where the logic lives. When two designs are plausible and switching later would be costly, show both with what each one loses, and ask.
4. **Build in verifiable units.** Start with the thinnest slice that works end to end. Each unit ends with its check passing before the next begins.
5. **Verify the whole** against the checks from step 2, and report the evidence.

Work the request as given: note follow-ups and neighbouring improvements in the reply instead of building them.

Done when every check from step 2 passes on the real thing and the reply shows it.
