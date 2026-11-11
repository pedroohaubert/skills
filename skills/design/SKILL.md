---
name: design
description: Design and build user interfaces. Use when creating, changing, polishing, or reviewing any UI — a screen, component, animation, gesture, typography — or when picking a UI library or installing a ready-made component.
---

# Design

A router. Read this page, then only the files your task matches. The guides under `emil/` are Emil Kowalski's skills, vendored unmodified; when one names another skill, that skill is `emil/<name>/GUIDE.md`. `tactile/` is kosta4a's tactile-design, vendored unmodified: a complete visual system for tactile, layered, quiet product UI (white controls raised by a ring and a crisp drop, fields as wells, one black primary, hierarchy from ink steps), written as roles and ratios so it remaps to any palette and typeface.

**Tactile is the house style for new UI.** When the app has no visual identity yet, or the user asks for this look, adopt `tactile/GUIDE.md` whole and remap its tokens (`tactile/references/tokens.md`) to the brand. In an app that already has an identity, the app's tokens stay; tactile then lends only its process: the decision order, the per-area references, and the never-ship list, applied in the app's own values.

## Working on UI

1. **Match the app first.** Read its tokens, components, and a screen near the one you are changing. The app's visual identity outranks any guide here and any component's stock look. For a screen people work in (a list, queue, or detail panel), write whose turn it is in each state before drawing anything.
2. **Find the precedent.** Name the job the screen does and the established app that already does it well (`precedents.md`), look at that app's real screen, and borrow its structure. Invent only where no precedent fits, and say in your reply which precedent you followed.
3. **Lay out the information.** Decide what the eye lands on first, second, third, and arrange for exactly that, following `composition.md`. When the design is not given, sketch two genuinely different directions (often two precedents), pulled far enough apart that the difference is obvious; write what each one loses, and pick. When neither wins, look for the third idea that keeps the strength of both.
4. **Look at it.** Run the result and capture it at the sizes it ships in, measuring alignment instead of eyeballing it (`verify.md`). Iterate on what you see until it holds, then show the user with framing: the job the screen does, the precedent it follows, and what it improves for the people using it. Skip the tour of what is already visible on the screen.
5. **Take feedback precisely.** Move only what was criticized and keep every approved decision. When a remark could be praise or complaint, or the element it names is unclear, ask which one in a single line first.

Done when the screen is captured running, every alignment claim has a measurement behind it, the precedent is named, and it reads as part of the same app.

## Where to read

| Task | Read |
|---|---|
| Arranging a screen people work in: list, queue, detail panel, activity, sections, headers, cards; or reacting to "it looks ugly" | `composition.md` |
| Choosing which established app to borrow from for a feature | `precedents.md` |
| Capturing a change when the app needs a login you can't do, or checking alignment and scrolling | `verify.md` |
| Choosing a library, or installing a ready-made component | `libraries.md` |
| Any motion: animation, transition, gesture, drag | `motion.md` |
| Fonts, type sizes, line length, spacing of text | `typography.md` |
| Starting product UI with no visual identity yet, or the user asks for a tactile, layered look | `tactile/GUIDE.md`, then its `references/tokens.md` to remap palette and typeface |
| Deciding action weight (one primary, secondary, utility, destructive), how much data to show, or where controls go | `tactile/GUIDE.md` (the decision order), then `tactile/references/decisions.md` |
| Buttons, fields, toggles, switches, badges, and their states | `tactile/references/buttons-and-controls.md` |
| Elevation, shadows, light versus dark, modals, sheets, menus, toasts, cards, tables | `tactile/references/surfaces-and-layering.md` |
| Polishing or reviewing a component: the craft bar and checklist | `emil/emil-design-eng/GUIDE.md`, then the "Never ship" list in `tactile/GUIDE.md` |
| Trying several versions of one UI piece side by side | `emil/prototype/GUIDE.md` |
| Stress-testing a UI with worst-case data | `emil/break-ui/GUIDE.md` |
| A web app that must feel native on a phone | `emil/mobile-native/GUIDE.md` |
| Apple-style interfaces: materials, depth, fluid motion | `emil/apple-design/GUIDE.md` |
| React Native or Expo | `emil/animate-expo/GUIDE.md` |
| Swift | `emil/write-swift/GUIDE.md` |
