---
name: design
description: Design and build user interfaces. Use when creating, changing, polishing, or reviewing any UI — a screen, component, animation, gesture, typography — or when picking a UI library or installing a ready-made component.
---

# Design

A router. Read this page, then only the files your task matches. The guides under `emil/` are Emil Kowalski's skills, vendored unmodified; when one names another skill, that skill is `emil/<name>/GUIDE.md`.

## Working on UI

1. **Match the app first.** Read its tokens, components, and a screen near the one you are changing. The app's visual identity outranks any guide here and any component's stock look. For a screen people work in (a list, queue, or detail panel), write whose turn it is in each state before drawing anything.
2. **Find the precedent.** Name the job the screen does and the established app that already does it well (`precedents.md`), look at that app's real screen, and borrow its structure. Invent only where no precedent fits, and say in your reply which precedent you followed.
3. **Lay out the information.** Decide what the eye lands on first, second, third, and arrange for exactly that, following `composition.md`. When the design is not given, sketch two genuinely different directions (often two precedents), write what each one loses, and pick.
4. **Look at it.** Run the result and capture it at the sizes it ships in, measuring alignment instead of eyeballing it (`verify.md`). Iterate on what you see until it holds, then show the user.
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
| Polishing or reviewing a component: the craft bar and checklist | `emil/emil-design-eng/GUIDE.md` |
| Trying several versions of one UI piece side by side | `emil/prototype/GUIDE.md` |
| Stress-testing a UI with worst-case data | `emil/break-ui/GUIDE.md` |
| A web app that must feel native on a phone | `emil/mobile-native/GUIDE.md` |
| Apple-style interfaces: materials, depth, fluid motion | `emil/apple-design/GUIDE.md` |
| React Native or Expo | `emil/animate-expo/GUIDE.md` |
| Swift | `emil/write-swift/GUIDE.md` |
