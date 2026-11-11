---
name: retro
description: End-of-session retrospective, started only by the user with /retro, that turns the session's corrections, approvals, and discoveries into checks, lessons, and memories, shown and approved first.
disable-model-invocation: true
---

# Retro

Run this only when the user typed `/retro` or asked for a retro by name. If you reached this file any other way, stop and go back to the task.

A retro is an after-action review of the whole session: what was meant to happen, what happened, why they differ, what to sustain and what to improve. The rules it applies live in `~/.agents/learning.md`: signals, the bar, the lesson format, routing, asking first. Read that file in full before step 1; this skill adds the depth a single task does not have time for.

## 1. Gather the raw material

Work from primary sources, not from your memory of the session:

- **The transcript.** Find it with pstack's `reflect` finder (`skills/reflect/scripts/find-transcript.mjs` under the installed plugin, with `claude-project-dir.mjs` beside it for this session's directory), then read every user message in order. Read only this project's transcripts.
- **What changed and what was redone.** `git log` and `git diff` for each repo the session committed to, since the session began. A change that was made and then changed again marks a correction, even when the user's words were mild.
- **What was remembered.** The memory files this session created or updated.
- **The ledger.** In the user's skills repo (`readlink ~/.agents/AGENTS.md` shows where), `git log --format='%h %ad %s' --date=short --grep='^lesson'` lists the global lessons applied so far, and `git show --stat <hash>` shows which file each one landed in. This project's feedback memories list the local ones.

Done when you hold the user's messages in order, the session's commits per repo, the memory changes, and the ledger.

## 2. Harvest every signal

Go through the user's messages one by one and mark each that corrects, approves, or decides something, using the loud and quiet kinds in `learning.md`. Add your own discoveries: beliefs that proved false, causes blamed before proof, tools that failed, steps repeated by hand. Cross-check with step 1's commits: a redo with no matching message is a quiet correction.

Done when every user message that corrected, approved, or decided something maps to a signal, every redo in the commits maps to one, and each signal carries the user's words or the evidence.

## 3. Find causes and check the ledger

For each correction and discovery, ask why until you reach a cause the next agent could act on. When the cause is a guess, either prove it the way `~/.agents/playbooks/bug-fix.md` step 2 asks, or mark the lesson unproven and drop it. For each approval, name what made it work.

Then check whether earlier lessons held:

- A signal that matches a lesson already in the ledger or in a feedback memory is a **repeat**: the earlier lesson did not hold. It goes to structure, not more prose. A signal can be both an approval and a repeat (the user kept the fix for a lesson you had first skipped): sustain or improve describes the signal, and the repeat decides the kind.
- A lesson that matches signals from earlier sessions (the ledger, this project's memories) is **frequent**: rank it higher.
- A ledger lesson that this session contradicted, or that the user overruled, is **stale**: propose removing or rewriting it.

Done when every signal has a proven cause, an unproven mark, or a "will not recur" mark, and every repeat and stale lesson is named.

## 4. Write the lessons and route them

Group signals that share a cause into one lesson. Apply the bar from `learning.md`, write each surviving lesson in its four-part format, and pick its target from the routing table. Write the general core of a project lesson globally only when it has happened in more than one project.

Done when each lesson has its four parts, a target file, and a kind: `check` (code that fails on the old way), `structure`, `rule` (prose), `prune` (remove or rewrite a line), or `memory`.

## 5. Show the plan and ask

Present the plan in the user's language, with no edits made yet. Text that will land in the skills repo is shown in English, exactly as it will be written. One table, holding only the rows you propose; merged signals appear in their lesson's row:

| # | Lesson (one line) | Sustain / improve | Signal (quote or evidence) | Target | Kind | Change |
|---|---|---|---|---|---|---|

Under it: the exact text of every `rule` and `prune` row, the shape of every `check` and `structure` row (what it inspects, the message it fails with, the past mistake it must catch), and the dropped signals, one line each with the reason (already recorded at a named place, a pending pull request, will not recur, unproven). Memory rows are applied after this step without asking; list them so the user can veto.

Ask with a multi-select question which rows to apply. The user may also redirect a row's target.

Done when the user has answered.

## 6. Apply and prove

- **Project rows:** invoke pstack's `correct` on the project repo with the approved lessons as input. It builds the check or structure and proves it fails on the real past mistake. The repo's own branch and PR flow applies.
- **Global rows:** edit the target after loading `writing-for-agents`, one commit per lesson with a subject starting `lesson(<area>):`. Run `check-tree.sh` after editing the tree. The post-commit hook applies the change to this machine; push only when the user approves.
- **Prove each global lesson with a blind run:** a fresh subagent gets a short scenario that should trigger it and reports which files it read and what it would do. For a lesson that changes when the agent acts, add a control scenario where it must not act. The lesson passes when the subagent reaches the file, applies the rule, and stays quiet in the control.

Done when every approved row is applied, every check has failed on the old mistake and passed on the fix, and every global lesson passed its blind run.

## 7. Report

In the user's language, short:

- each applied lesson: where it lives, and what enforces it (a check, a test, structure, or prose only);
- each dropped signal and why;
- what is left that only the user can decide, such as pushing the skills repo.
