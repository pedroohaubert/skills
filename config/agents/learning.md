# Learning

How a session's corrections, approvals, and surprises become durable improvements to how agents work for this user. Two things read this file: the optional **learning loop** below, which any agent may run on its own judgment, and the `retro` skill, a thorough pass over a whole session that only the user starts.

Everything here follows one idea from the after-action review: compare what was meant to happen with what happened, find why they differ, and decide what to **sustain** and what to **improve**. Sustain matters as much as improve: an approach the user liked is lost as easily as a mistake is repeated.

## Signals

A **signal** is evidence that something about how you work should change or stay. Look for four kinds, and record each with the user's words or the evidence itself.

- **Correction:** the user rejects, redirects, or calls something wrong, ugly, slow, or not what they asked. What you had done, and what they wanted instead.
- **Approval:** the user keeps, praises, or builds on a choice that was not the obvious default. What made it work.
- **Discovery:** something you believed turned out false, a cause you blamed was not the cause, a tool or path failed, a step had to be repeated by hand.
- **Decision:** the user settles a rule ("this tab is the default", "these two environments stay separate").

The loud signals are easy. The quiet ones are where most learning hides:

- the user rewrites your text or redoes your change themselves instead of commenting;
- the user repeats an instruction they already gave, in this session or an earlier one;
- the user builds on your choice without remarking on it, which is an approval;
- the user asks the same clarifying question twice, a sign your output was unclear;
- frustration in the wording, even when the request itself is small.

## The bar

Most tasks end with nothing worth recording, and that is the normal outcome. A signal becomes a **lesson** only when all three hold:

1. **It will recur.** The next agent, on this project or another, would plausibly do the same thing again. A typo, a misunderstanding already cleared, or a permission given once for one action does not recur.
2. **It is not already recorded and followed.** Search the likely homes first (the `~/.agents/` tree, the matching skill's reference files, the project's AGENTS.md and docs, agent memory).
3. **Its cause is known.** For a correction or discovery, you can say why it happened, proven the way `~/.agents/playbooks/bug-fix.md` step 2 asks before a cause is named. A rule written on a guessed cause teaches the wrong lesson.

When a lesson is already recorded, the existing line decides what to do:

- **recorded and followed:** nothing to do;
- **recorded but vague**, so it did not guide you: sharpen that line instead of adding another;
- **recorded, clear, and skipped anyway:** a **repeat**. Prose did not hold, so propose structure (a check, a script, a type, a guard that fails on the old way) rather than restating it. pstack's `correct` skill builds those. The cause the bar asks for is the mistake's, which the recorded rule already names; why the rule was skipped needs no proof, because structure holds either way.

## Writing a lesson

A lesson is written for the next agent, who was not in the session and will meet a similar situation elsewhere. Four parts, in order:

1. **What happened**, in one or two sentences, with the case anonymized for global files: no company, client, colleague, repository, or branch names.
2. **Why** it failed or worked: the cause, not the symptom. For an approval, what made the choice right, so the next agent repeats it on purpose.
3. **The rule**, in positive form (what to do), short enough to recall mid-task.
4. **An example** in plain words, so the reader can picture the screen, the command, or the code.

Files in the user's skills repo are written in English, after loading the `writing-for-agents` skill; quote the user's signal in your proposal, not in the file.

### Examples

**From a correction (UI).** A section header showed the title in body size, a grey pill with the count, an info icon, and a rule under it; the reviewer called it messy, with no emphasis. Why: title, count, and description competed at the same weight, and the rule repeated an edge the card already had. Rule: a section header is a heading, with the title one step larger and bold, the count beside it at the same size in muted color, the explanation in a tooltip, and nothing under it. Example: "Triage 2 ⓘ" at 16px with the explanation on hover, instead of "Triage [2] ⓘ items that arrived and nobody looked at" in 14px with a border below.

**From an approval (UI).** In a detail panel, the block telling the viewer what to do next was redone as a dark strip after a white card was rejected, and the reviewer kept it. Why: it is the only inverted block on the panel, so the next action is found at a glance while everything else stays calm. Rule: the one block that asks for action gets a distinct treatment; when nothing is asked of the viewer, it shrinks to a plain line. Example: "YOUR TURN · Triage this ticket" with the primary button in the light color, versus "Now: waiting for triage" as one grey line for everyone else.

**From a discovery (diagnosis).** A service failed after a restart; the auto-reloader got the blame, was turned off, and the blame was written into three documents. A two-line test later showed the launcher wrapper stripped an environment variable. Why: the first plausible cause was recorded before a test separated it from the runner-up. Rule: prove a cause with the smallest distinguishing test before naming or recording it (now step 2 of the bug-fix playbook).

**Project-only.** A branch's migration reused a number another branch had already taken, and merging took hours. That belongs in that project, as a check in its branch verifier, not in the global setup. Its general core ("surface conflicts and numbering collisions when the branch is created, not at the pull request") goes global only once it has happened in more than one project.

## Routing

| The lesson is about | Goes to |
|---|---|
| This project: its code, workflow, tooling, data, conventions, recurring breakage | The project repo. Prefer a check, script, test, or structure over prose; pstack's `correct` builds them and proves each check on a real past mistake. The repo's own branch and PR flow applies. |
| A fact about this project worth knowing next session: a decision, a state, an owner | Agent memory. |
| How to work on any project: replies, autonomy, verification, delegation, code craft, writing | The deepest file in `~/.agents/` whose case it sharpens: a playbook step, a `code/` topic file, `setup.md` for how instructions evolve, and `AGENTS.md` only for what every task needs. |
| Craft knowledge for a domain a skill covers (UI composition, writing voice) | That skill's reference file, such as the `design` skill's `composition.md` or `precedents.md`. |

A repeat of a global lesson gets its structure in the global setup when it can: a script the matching skill ships and its steps tell the agent to run (a measurement helper in the design skill, a checker a playbook calls). It becomes a project check only when the guard needs that project's code.

Project specifics stay in the project: paths, branch and release rules, names, and errors only one codebase produces. When a project lesson has a general core, the core goes global, anonymized, and the specifics stay local.

When a new lesson contradicts or makes an older line stale, propose removing or merging the old line in the same change. Adding without pruning leaves layers that contradict each other.

## Asking and applying

- **Ask first** for every change outside agent memory, in the project repo and in the global setup alike: show the target, the exact text or the shape of the check, and the signal behind it, then apply only what the user approves. Use the question tool when the agent has one.
- **Memory** you update directly, and say so in the reply.
- **Commit** a global lesson in the skills repo with a subject that starts `lesson(<area>):`, one lesson per commit. That prefix is the ledger the `retro` skill reads to check whether earlier lessons held. The repo's post-commit hook applies the change to this machine; push only when the user approves.

## The learning loop

This loop is optional. Run it only when a signal in the current work clears the bar above; most tasks never get here.

1. When a lesson clears the bar, finish the task first.
2. After the main reply, propose it in a few lines: target, exact change, the user's words or the evidence. Three proposals at most, the strongest first.
3. Apply what the user approves, as **Asking and applying** says.

A thorough pass over a whole session, with harvesting, ledger checks, routing across every target, and blind tests, is the `retro` skill. Only the user starts it.
