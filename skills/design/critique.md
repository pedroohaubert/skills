# Critique

What a demanding reviewer rejected on operational screens (lists, queues, side panels, chat-like history), why, and what passed instead. Read it before composing such a screen and again before showing it.

## Flow before layout

Start from the workflow, not the widgets. For every state an item can be in, name whose turn it is and the one step that moves it; put that table in one tested module so no open state is left without an owner. The screen then answers "what needs me now". That framing passed; the first layout built on it did not, because it replaced the overview. Put the personal view as a tab beside the full list, and keep the full list as the default.

## Same object, same component

A subset of the items (a queue, a section, a filter) renders with the same table as the full list: same columns, cells, inline editing, toolbar, and filters. A hand-drawn row for the subset read as a different product and lost the filters people already used.

## Chrome stays quiet, signals stay loud

- Color lives in signals: state, priority, blocked, age. Everything else is neutral.
- No container fill behind icons or item numbers; a tinted tile or pill there reads as decoration, not data.
- A section header is a heading: title one step larger and bold, count beside it at the same size in muted color, no rule under it. Explanatory copy goes in a tooltip, not beside the title.
- Not every block is a card. The one block that asks for action gets a distinct treatment (an inverted strip worked); when there is nothing to act on, a single plain line.

## Side panels

One scroll region. A sticky header with no border: near-opaque background, backdrop blur, and a bottom edge that fades. Put status badges on the header's first line to keep it short. Details as a property list, muted label on the left and value on the right, without an icon per label. Secondary forms open behind a button. A floating close button over scrolling cards, a fixed composer with a border, and prev/next arrows all failed.

History reads as a conversation: what a person wrote is a message, a state change is a centered notice between messages, and a notice names its object (which link was added, not "edited links"). The composer sits at the end of the thread, starts at one line, grows with the text, and sends on Enter.

## Hit areas and affordance

The whole row opens the item. An inline editor covers only its content (the badge, the name), never the whole cell, and the title always opens. Anything that overflows shows that it scrolls: a visible scrollbar on long menus, edge fades and wheel-to-horizontal on wide boards.

## Reading feedback

When a remark could be praise or complaint, or the element it names is unclear, ask which one in a single line before changing anything. Acting on a misread costs a full round.
