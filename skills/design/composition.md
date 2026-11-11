# Composition

How to lay information out on a screen people work in: lists, queues, detail panels, activity history, forms inside a workflow. This is opinionated on purpose. It records what a demanding reviewer rejected, why it failed, and what passed, so the next screen starts where the last one ended instead of repeating the same rounds.

Read it before composing such a screen, and again before you show it.

## The stance

- **Arrangement is the design.** Most rejected screens had fine colors and type; they failed on where things sat and how much of the screen each thing claimed. Decide what the eye lands on first, second, third, and make the layout say exactly that.
- **Borrow a proven pattern before inventing one.** Every common job (a list of issues, a property panel, a comment thread, an inbox) has an app that solved it and that people already know how to read. Find it in `precedents.md`, take its structure, and spend invention only where the job is genuinely new.
- **Quiet chrome, loud signals.** Chrome is everything that frames data: containers, borders, backgrounds, headers, icons that label. Signals are the data that demands a decision: state, priority, blocked, overdue, whose turn. Chrome stays neutral and minimal so signals can be strong without the screen turning into noise.
- **Recompose, then calm it down.** A timid restyle of the old layout reads as "nothing changed"; a new layout full of tiles, tints, hovers, and icons reads as clutter. The target is a real change in structure delivered with very little decoration.
- **Subtract before adding.** Hunt for redundancy: elements that do the same job. A state shown as a badge, again as a highlighted stepper step, and again as a sentence is one fact told three times; keep the strongest form and cut the rest, or give each a different job. Merge, group closer, or delete before adding anything new.
- **Not everything is visible at once.** Digital screens can reveal over time: secondary forms, explanations, rarely used actions, and past history open on demand. Laying out every requirement on one page is the most common way a working screen turns into clutter.
- **Words are layout.** The right heading or button label replaces whole elements. "Your turn: triage this ticket" with one line of guidance did the work of an instruction paragraph plus a legend. Headings and actions stay short and specific to the item ("Send to review", not "Submit").
- **Leave room for the eye to pause.** Whitespace sets the reading rhythm: tight inside a group, generous between groups. Crowding every gap to fit more is how hierarchy disappears.
- **Consistency compounds; break it on purpose.** Same sizes, spacing, components, and words everywhere, checked like proofreading. Break the system only at one deliberate point, with a reason you can state: the inverted "your turn" strip below breaks the card pattern because it is the single block that asks for action.

## Start from the flow

Before drawing, write the workflow as a table: for each state an item can be in, whose turn it is and the single step that moves it forward. The screen exists to answer "what needs me now, and what do I do about it".

> Example: a ticket system had a list with tabs that were really saved filters ("Mine", "Triage", "To validate"). Mapping the states showed three roles with different questions: the reporter ("did anyone answer me?"), the triage team ("what arrived, what do I validate?"), the developer ("what do I pick up next?"). The fix was one table of "state → owner → next step", tested so no open state could end up owned by nobody, and every view built on it: grouped sections per role, a "your turn" block in the detail with the exact action, the pending question shown where the answer is typed.

The personal view goes beside the overview, never in its place. In that redesign the "for you" tab first replaced the full list as the default and was rejected: people still navigate by the whole list and filter it themselves. Default to the overview; the personal view is one click away.

## One object, one component

When a subset of the same items appears somewhere else (a section, a queue, a dashboard widget), it renders with the same component as the main list: same columns, same cells, same inline editing, same toolbar and filters.

> Example: the "for you" sections first used a hand-drawn row (icon tile, title, subtitle, badge, avatar). It looked like a different product beside the main table, lost the filters people already used, and invited a second round of alignment bugs. Rendering each section as the main table, inside its own card and fed by the same filtered rows, fixed all of it at once.

Same rule across views: the toolbar sits in the same place in list and board views, and the same object never gets two visual vocabularies.

## Hierarchy: headings, counts, explanations

- A section header is a heading, so it looks like one: title a step larger than body text and bold, the count beside it at the same size in a muted color, and nothing under it. No rule under a header that already sits at the top of its own card.
- Explanatory copy ("these arrived and nobody looked at them yet") goes in a tooltip behind a small info icon next to the title. Inline beside the title, it competed with the title and made the header look lost.
- One emphasis per block. When the title, the count, and a description all compete at the same weight, nothing reads as the header.

> Example: a section header with a 14px title, a grey pill holding "2", an info icon, and a bottom border read as "messy and nameless". The version that passed: 16px bold title, "2" in the same 16px muted, the info icon aligned to the text, no border.

## Containers and surfaces

- **Not everything is a card.** Cards are for objects that stand alone. A page of white cards with equal weight says everything matters equally, which means nothing does.
- **The block that asks for action gets its own treatment.** In a detail panel, the "your turn: triage this" block first rendered as one more white card and read as generic. An inverted strip (dark background, light text, primary button in the light color, secondary buttons outlined in the light color, destructive actions as red text on the right) worked, because it is the only inverted block on the panel. When it is someone else's turn, there is no block at all: one plain line, "Now: waiting for triage".
- **No fill behind labels of data.** A tinted square behind a type icon and a pill behind an item number were both rejected as decoration posing as data. The icon and the number stand on their own; give the number weight with type, not a background.
- **Panels are a grey canvas with white cards on it**, not a white sheet with white boxes: the contrast is what separates the cards without heavy borders.

## Detail panels

- **One scroll region.** The whole panel scrolls as one. A fixed header with a border, a fixed comment box at the bottom with a border, and a close button floating over cards all failed, because content slid under hard edges.
- **When something must stay visible, make it sticky without a border.** The header that passed: near-opaque background matching the panel, a backdrop blur, and a bottom edge that fades out over a few pixels, so content dissolves under it instead of being cut by a line. Keep the sticky part short: status badges moved up to the first line, next to the type and number, so the sticky header costs less height.
- **Details as a property list:** muted label on the left in a fixed column, value on the right, one per row, no icon per label. A three-column grid of icon-plus-label blocks read as a dashboard of tiles.
- **Secondary forms open on demand.** An always-open "add link" form (two inputs, a button, a help paragraph) dominated the card it lived in; a single "Add link" button that opens the form and closes it after adding fixed it.
- **Progress as a segmented bar, not a pill among words.** A stepper that rendered the current step as a colored pill inline with plain-text neighbours looked broken. Equal segments, filled in the state's color up to the current step, labels underneath with the current one bold, read instantly.
- **No in-panel navigation between items** (prev/next arrows, "3 of 5", auto-advance after acting). The reviewer saw no sense in it and it fought the list, which already shows what is next.

## Activity reads as a conversation

History that mixes comments and changes reads like a chat, not a vertical timeline with an icon rail.

- What a person wrote (a comment, the question that asked for information, the answer, the reason for a refusal) is a message bubble with avatar and name. The current user's messages sit on the right in the primary color.
- What only changed the item (state moved, field edited, item opened) is a small centered notice between messages: "Ana rejected · In review → In progress · 2 days ago".
- A notice names its object. "Bruno edited links" told nothing; "Bruno added the link *Review thread with Ana*", with the name clickable, and a struck-through name for a removed link, told everything.
- Verbs in the past tense, as a person would say them: "rejected", not the button label "reject".
- The composer sits at the end of the thread, not pinned to the panel. It starts at one line, grows with the text up to a limit and then scrolls, sends on Enter with Shift+Enter for a new line, and has a round send button that is muted while empty and solid when there is something to send.

> Example: the first version was a timeline with icons on a vertical rule, state pills for every transition, and the comment text tucked under each entry. The reviewer called it hard to read; turning it into a conversation made the pending question and its answer obvious at a glance.

## Lists and tables

- **The whole row opens the item.** Inline editors cover only their content (the badge, the name, the icon), never the whole cell, and the title always opens the item instead of editing it. Editors that filled their cells left only a sliver of each row clickable.
- **The identifier is not in the corner.** Putting the type icon first and the number second moved the number off the edge where it read as a margin artifact; the number gets semibold weight, not a pill.
- **Priority is a small red flag beside the title.** Next to a type icon it looked crooked; once the type became its own column, the flag beside the title was right. Stay consistent: the same flag in the table and on board cards; spell it out ("High priority") only in the detail header.
- **Color only in state badges and true signals.** Tinted columns, colored bands on cards, and colored type icons were all rejected; a colored dot inside the state badge, and the same dot beside each state in the filter menu, passed.

## Affordance and alignment

- **Show that it scrolls.** A menu with more options than its height needs a visible scrollbar; on macOS overlay scrollbars hide until scrolled, so nobody knew the last states existed. A wide board needs edge fades where columns are hidden and must scroll horizontally with a plain mouse wheel, not only a trackpad.
- **Align by measurement.** Icons center under their column label; text starts where its label starts. Misalignments of 5 to 8 pixels were spotted every time by eye and fixed only after measuring (see `verify.md`).
- **Consistent control sizes.** One height for buttons and inputs in a toolbar; mixing sizes reads as unfinished.

## Reading the reviewer

- Feedback arrives in slang, in fragments, sometimes with a pasted element selector. When a remark could be praise or complaint, or the element it names is unclear, ask which one in a single line before changing anything. A misread ("this one's fine" taken as approval of the wrong card) cost a full round and an angry reply.
- When the reviewer says something "looks ugly" without saying why, look for the composition cause first (competing emphasis, an unneeded container, a hard edge, a misalignment) before reaching for color.
- Keep every approved decision. Each round should only move what was criticized; re-opening approved parts burns trust.
