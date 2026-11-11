# Precedents

Before inventing a layout, find the app that already solved the same job and borrow its structure. People read a screen faster when it follows a pattern they have met elsewhere, and a proven pattern has already survived the review rounds you are about to face.

## How to use a precedent

1. **Name the job, not the widget.** "See what needs my action across many items" is a job; "a list with tabs" is a widget. Look the job up below.
2. **Look at the real screen.** Open the product, a screenshot search, or a pattern gallery (the Inspo MCP when it is connected). Memory of an app is vaguer than the app; borrow from what you actually see.
3. **Take the structure, keep the house look.** Borrow arrangement, hierarchy, density, and interaction: what sits where, what is emphasized, what opens what. Colors, type, components, and icons stay the app's own (step 2 of `SKILL.md` outranks any precedent).
4. **Say which precedent and what you took** in your plan and in the reply that shows the screen: "activity follows the GitHub pull request timeline: events as compact lines between comment bubbles". It makes the choice reviewable and gives the reviewer a shared reference to argue with.
5. **When two precedents disagree,** pick the one closest to the users' density and domain: a back-office tool used all day leans toward Linear and Airtable, an occasional consumer flow toward Stripe Checkout and Apple.

## Catalog

### Item list with status (issues, tickets, orders, requests)
- **Linear issue list; GitHub Issues.**
- Borrow: dense rows with identifier, title, status, owner, last update; whole row opens the item; filter bar of chips above the list; list and board views behind one toggle that stays in the same place; grouping by status as collapsible sections inside the same list.
- Avoid: card grids for items people compare row by row.

### "What needs me" queue
- **Linear My Issues and Inbox; GitHub notifications and review requests; Superhuman / Gmail split inbox.**
- Borrow: a personal view beside the overview, never replacing it; grouping by why it is yours (assigned, review requested, waiting on your answer) with a count per group; the same row component as the overview.
- Avoid: making the personal view the only door to the data.

### Detail of one item
- **Linear issue view; Jira issue view; Notion page with properties.**
- Borrow: title and status at the top; description first in the body; properties as a label-and-value list (Notion, Linear sidebar) with inline editing on the value; activity below the content.
- Avoid: a grid of icon tiles for properties; prev/next arrows inside the panel.

### The next action on an item
- **GitHub pull request merge box; Stripe "action required" banners; Vercel deployment status block.**
- Borrow: one block that says what state the item is in, what is blocking it, and the single main action, visually distinct from everything else; when nothing is required, it shrinks to a status line.
- Avoid: rendering the action block like every other card on the page.

### Activity that mixes comments and changes
- **GitHub pull request timeline (events as small inline lines with an icon, comments as full blocks); Linear activity; Slack and iMessage for message bubbles.**
- Borrow: what people wrote is prominent, what the system recorded is compact and muted between messages, each event names its object ("added the label *bug*"), newest at the bottom with the composer after it.
- Avoid: a vertical rail of identical icons where comments and field changes weigh the same.

### Writing a message or comment
- **Slack composer; iMessage; ChatGPT and Claude input.**
- Borrow: one line that grows with the text up to a cap, Enter sends and Shift+Enter breaks the line, a round send button that turns solid only when there is text, the composer at the end of the thread.
- Avoid: a fixed-height textarea pinned to the panel bottom with a border.

### Board of columns by status
- **Linear board; Trello; GitHub Projects board.**
- Borrow: minimal cards (identifier, title, owner, age), status color only in the column header badge, column counts, horizontal scrolling with the mouse wheel and edge fades where columns are hidden, drag to change status.
- Avoid: colored bands on every card, tinted columns.

### Table with filters
- **Airtable; Notion database; Linear filters; Stripe dashboard tables.**
- Borrow: faceted filter menus with search and a colored dot per status option, a visible scrollbar when the menu overflows, a column visibility menu, sticky column headers, row click opens the detail.

### Progress through stages
- **Shopify order status; Stripe onboarding checklist; delivery trackers.**
- Borrow: equal segments filled up to the current stage, stage names under each segment with the current one bold; off-path states (cancelled, rejected) show only their badge.
- Avoid: a pill for the current stage sitting inline with plain-text neighbours.

### Header that stays while content scrolls
- **iOS navigation bar; Apple materials; Linear and Arc top bars.**
- Borrow: translucent background close to the surface color, backdrop blur, a soft fade at the bottom edge instead of a border, the header kept short.

### Adding something secondary inside a detail
- **Linear "Add link"; Notion "+ Add a property"; GitHub "Add a label".**
- Borrow: a quiet text button that expands into the small form and collapses after saving; the empty state is the button itself, not a sentence plus a button.

### Empty states
- **Linear; Stripe.**
- Borrow: one sentence saying what will appear here and when, one action that moves forward. No illustration on a work tool.

### Settings and configuration
- **Vercel and GitHub settings.**
- Borrow: left navigation by area, each section with a heading, one line of description, the control, and its own save.

### Numbers at a glance
- **Stripe dashboard; Vercel analytics.**
- Borrow: a few metrics with a delta against a reference, a sparkline when the trend matters, one chart per question.

### Command and search
- **Raycast; Linear and Vercel command menus (Cmd+K).**
- Borrow: one input, grouped results, the action named on each result, keyboard first.
