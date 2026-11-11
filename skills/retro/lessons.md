# Writing a lesson

A lesson is written for the next agent, who was not in the session and will meet a similar situation in a different project. It must survive that move: concrete enough to change behavior, general enough to apply elsewhere.

## Format

Each lesson has four parts, in this order:

1. **What happened**, in one or two sentences, with the concrete case anonymized (no company, client, colleague, or repo names in global files).
2. **Why** it failed or worked: the cause, not the symptom.
3. **The rule**, stated as what to do (positive form), short enough to recall mid-task.
4. **An example** in plain words, written so a reader can picture the screen, the command, or the code.

Corrections and approvals use the same format. An approval's "why" is what made the choice right, so the next agent can repeat it on purpose instead of by luck.

## Examples

### From a correction (UI composition)

- **What happened:** a section header showed the title in body size, a grey pill with the count, an info icon, and a rule under it. The reviewer called it "messy, with no emphasis".
- **Why:** the title, the count, and the description competed at the same weight, and the rule repeated an edge the card already had.
- **Rule:** a section header is a heading: title one step larger and bold, count beside it at the same size in muted color, explanation in a tooltip, no rule under it.
- **Example:** "Triage 2 ⓘ" at 16px, with "2" muted and the explanation on hover, instead of "Triage [2] ⓘ — items that arrived and nobody looked at" in 14px with a border below.

### From an approval (UI composition)

- **What happened:** in a detail panel, the block telling the user what to do next was redone as a dark strip after a white card was rejected, and the reviewer kept it.
- **Why:** it is the only inverted block on the panel, so the next action is found at a glance, while the rest stays calm.
- **Rule:** the one block that asks for action gets a distinct treatment; when nothing is required of the viewer, it shrinks to a plain line.
- **Example:** "YOUR TURN · Triage this ticket", with the primary button in the light color, versus "Now: waiting for triage" as a single grey line for everyone else.

### From a discovery (verification)

- **What happened:** a service failed after a restart; the auto-reloader got the blame and was turned off. The real cause was a launcher wrapper that strips environment variables. A two-line test later proved it.
- **Why:** the first plausible cause was written down as a rule before the smallest test that could separate it from the alternatives.
- **Rule:** before recording a cause as a rule, prove it with the smallest test that distinguishes it from the next most likely cause.
- **Example:** print the variable from a child process of the reloader and from a process started through the wrapper; only one of them loses it.

### Project-only (stays in the project)

- A release branch conflicted because a migration reused a number another branch had taken. This belongs to that project's repo, as a check in its branch verifier, not in the global setup. Its general core ("surface merge conflicts and numbering collisions when the branch is created, not at the pull request") can go global if it has happened in more than one project.
