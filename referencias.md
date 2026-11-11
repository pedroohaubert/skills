# References

What we studied to build this setup. Each entry gives the source, what it says, and what we took from it. New entries go at the end, with the date we read them.

## The thesis

> The secret isn't in the prompt; it's in the setup you give the agent to test what it's doing.

The inverted pyramid of where to invest, strongest first:

1. **Codebase**: good API, architecture, refactoring.
2. **Static analysis**: lint, types, compiler, tests, CI.
3. **Verification**: formal and empirical.
4. **Prose**: rules, skills, AGENTS.md.
5. **Human review.**

Corollaries we noted with it:

- Modules with a well-defined API, separating the interface from the implementation.
- As few `.md` files as possible.
- "Software factory" is marketing. What works is good software engineering and spending tokens in the right place.
- The more deterministic, the better, and the cheaper in tokens.

## Articles and papers

### Which Claude model should you build with? (Addy Osmani, 2026-11-09)
https://claude.dev/blog/which-claude-model-should-you-build-with/ · read 2026-11-10

- Start with Opus 5.5 at `medium`. For a well-bounded task, step down to Sonnet; for classifying or extracting, to Haiku. For the hardest work and long unattended runs, step up to Fable.
- If the model can't do it, the order is: give it a way to verify itself (test, build, script), raise effort one level, and only then switch models.
- Above `high`, one more level of effort costs almost as much as a bigger model. Test the bigger model at a lower effort.
- Use a subagent for cheap work that is easy to check (search, logs, running tests), on Haiku or Sonnet. Code editing and judgment stay on the main model.
- Running at `low` and repeating only the failures at `high` gave the same accuracy as everything at `high`, for about 60% of the cost.

**We took:** Opus `medium` as the default, nothing at `xhigh` without measuring, verification before effort.

### When to fold subagents into your main agent loop (Diane Sarkis, 2026-10-22)
https://claude.com/resources/articles/building-agents-when-to-fold-subagents-into-your-main-agent-loop · read 2026-11-10

- One agent that loads skills and tools as it needs them often beats a design with subagents. It was 2x faster in a real case.
- Each subagent returns a lossy summary, and chaining several turns into a game of telephone.
- A subagent is justified by proven context bloat, by parallel tasks that need clean, disposable context, or by too many tools to choose from.
- Split by context, not by org chart. A skill for "how we do it"; a tool for action, live data, and hard limits.
- Tool selection gets worse past 30 to 50 definitions.
- Before changing the architecture, build a small end-to-end eval and run each task more than once.

**We took:** the default of one agent; subagents only for broad reading in parallel.

### Harness Engineering: Anatomy, Architecture, and Evolution of Coding Agents (Barbaste et al., 2026-07)
arXiv:2609.00006 · https://arxiv.org/abs/2609.00006 · read 2026-11-10

- A study of the source code of 11 harnesses: Claude Code, Codex, Gemini CLI, Mistral Vibe, OpenHands, Aider, Mini-SWE-Agent, Hermes, Pi, OpenCode, and OpenClaw.
- None uses an agent framework (LangChain and the like) or RAG with embeddings over code. All use grep, glob, tree-sitter, and context `.md` files.
- Mini-SWE-Agent, about 100 lines and only bash, lands in the same benchmark range as the large systems.
- In one system that evolves its own harness (Lin et al.), tools gave +3.3 points, middleware +2.2, and memory +5.6. The system prompt alone gave **−2.3**. Structure weighs more than prose.
- Over the quarter, behavior rules moved from prose into configuration: the harness now guarantees what used to exist only as prompt text.
- Skills are already adopted more than MCP (9 of 11 against 8 of 11). Treat a third-party skill as a package: a trusted source, review, quarantine.
- Stay with one agent until there is a broad exploration phase where parallel context clearly beats serial search.

**We took:** the numeric evidence for the thesis; third-party skills come in curated.

### Karpathy-inspired guidelines (multica-ai, 2026-01)
https://github.com/multica-ai/andrej-karpathy-skills · read 2026-11-10

A single `CLAUDE.md` built from Karpathy's observations on LLM coding mistakes: it assumes things without checking, doesn't ask, doesn't show trade-offs, overcomplicates, and edits code it doesn't understand. Four principles:

1. **Think before coding.** State assumptions, show the possible readings, say if there is a simpler path, and stop when confused.
2. **Simplicity.** The minimum that solves it: no single-use abstraction, no unrequested configuration, no error handling for impossible cases.
3. **Surgical changes.** Every changed line traces to the request; follow the existing style; mention dead code you see, without deleting it.
4. **Goal-driven execution.** Turn the task into a verifiable criterion ("write the test that reproduces the bug and make it pass") and iterate until verified. From Karpathy: "don't tell it what to do, give it the success criteria and let it go."

**We took:** all four went into our universal AGENTS.md, along with the corrections you repeat in the history.

## Design: articles

Read 2026-11-10. What went into the `design` skill is in `skills/design/`.

| Source | What it says | We took |
|---|---|---|
| [Code as the Source of Truth](https://www.tonyward.dev/articles/code-as-the-source-of-truth) (Tony Ward) | Code, not Figma, is the source of truth. A designer prototypes with real components and an engineer takes them to production; an expert reviews each step. "You don't ship slop — you ship code and designs you'd stand behind." | Design happens in the running app, with the real components. |
| [Practical Typography](https://practicaltypography.com/) (Matthew Butterick) | Online typography book. Web body text 15 to 25 px, line height 1.2 to 1.45, line length 45 to 90 characters, 5 to 12% letterspacing in all caps, curly quotes. | `skills/design/typography.md` |
| [How to choose a UI font (and 10 Inter alternatives)](https://yeptype.com/article/inter-alternatives) (Yep! Type) | A UI font needs cap-centered metrics and an x-height around 75%, or the text sits low in buttons. Alternatives: Innovator Grotesk, Universal Sans, Plain, SwissNow, Muoto, Aktiv Grotesk, Akkurat, Basier, CoFo Sans, Unifora. | `skills/design/typography.md` |
| [Lessons of Design](https://lessons.design/) (Fabricio Teixeira, founder of UX Collective) | Seven lessons from 20 years of product design. The site renders client-side: a plain fetch returns only the title, so it was read through headless Chromium on 2026-11-10. Concrete rules: train the eye to spot redundant elements and merge them; not everything must be visible at once; words can replace UI elements; leave space for the eye to pause; consistency compounds, and break the system only on purpose with a stated reason; pull two directions far apart, and when two ideas argue find a third; when presenting, frame the work (why, what inspired it, what it improves) instead of describing what is on screen. | `skills/design/composition.md` (stance) and `SKILL.md` steps 3 and 4. |

## Design: components and tools

Read 2026-11-10 through their `llms.txt` files. All are in `skills/design/libraries.md`, with install instructions.

| Source | What it is |
|---|---|
| [interior.dev](https://www.interior.dev/llms.txt) (favourite) | Micro-interactions in React with Motion, for feedback after a click: copy button, loading button, hold to confirm, modal, drawer. MIT, with a shadcn registry. |
| [Dice UI](https://diceui.com/llms.txt) (favourite) | Accessible components that extend shadcn, on Base UI or Radix: data table, data grid, kanban, combobox, file upload, stepper, tour. |
| [aicss.dev](https://www.aicss.dev/llms.txt) | Components for AI agent interfaces: thinking state, tool calls, streaming text, citations, file diff. 20 components, 15 free. |
| [Fancy Components](https://www.fancycomponents.dev/llms.txt) | Effects for landing and artistic pages: text animations, image trail, physics, SVG filters. shadcn registry `@fancy`. |
| [bencho.dev](https://bencho.dev/llms.txt) | 165 artistic interactive blocks: dynamic island, magnifying dock, card stack. MIT; you copy the code. |
| [loading.dev](https://loading.dev/llms.txt) | Loading spinners for React 19+, package `loading-dev`. |
| [ascii.rest](https://ascii.rest/llms.txt) | Animated ASCII art and banners, package `ascii.rest`. |
| [microinteractions.dev](https://microinteractions.dev/llms.txt) | Micro-interaction studies with demos and timing notes (work in progress): text swap button, hold to confirm, tab indicator, tooltip that respects the edge. Cited in `skills/design/motion.md`. |
| [Shoogle](https://shoogle.dev/mcp/shoogle-skills) | Component search across shadcn registries, through MCP (`https://mcp.shoogle.dev/mcp`, no account) or the shadcn CLI (`search @shoogle -q`). It is the fallback when the preferred libraries don't cover a need. Registered in `mcp-servers.txt` and `opencode.jsonc`. |

## Posts

### "The secret is in the prompt" (post, author not recorded)

The counterpoint. Say what you want; if it doesn't work, ask why and how to improve; have the agent search Google, Stack Overflow, and GitHub, because "99% of your problems are solved there".

**We took:** kept as the contrast. Searching the web is still useful, but it doesn't replace the agent being able to test its own work.

### Teaching the agent "design" (thread, author not recorded)

- The agent drew an onboarding popup in two directions on a canvas: A, a three-step tour; B, a looping animation.
- It wrote what each one loses and chose B, because A added "two extra clicks on an announcement most people close quickly".
- The feedback described the symptom as a user: "I can't tell which one is highlighted", "the wait is horrible". The agent found the fix (the row became a progress bar).
- The rule: explore directions, reason, and iterate at every step before sending for review. It is chain of thought applied to design.

**We took:** the canvas is the design's verification surface. Feedback describes the symptom, not the fix.

### A project that gets slow over time (question + answers)

Question: "what took 10 minutes with Claude 5.5 now takes 40; how do I prevent it?" Answers: modules with a well-defined API (`api:impl`) and as few `.md` files as possible.

**We took:** small boundaries so the agent reads the interface, not the implementation; one fast command that runs all checks; delete stale `.md`; a fresh session per unit of work; a repeated error becomes an automatic check.

## Repositories

| Repo | What it is | Status in the setup |
|---|---|---|
| [cursor/plugins › pstack](https://github.com/cursor/plugins/tree/main/pstack) | The poteto skills and playbooks. The guide (`docs/guide/`) puts verification at the center: `create-verification-skill`, `correct` (a repeated error becomes architecture, then a type, then a lint, then a test, and only last a text rule), `benchmark-checklist`, named principles that guide the agent. | In use through the fork `michael-denyer/pstack-claude`. To curate: keep the verification parts, review the parts that trigger many subagents and the session hook. |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | Design and animation skills (animate, review-animations, apple-design, break-ui…). It used to be `emilkowalski/skill`; it now also has `choreograph`, `gestures`, and `remove-animations`. | Copied into the `design` skill (`skills/design/emil/`, updated by `sync-emil.sh`). No longer installed separately. |
| [humanlayer/skills](https://github.com/humanlayer/skills) | `rpi` (research → plan → implementation in fresh sessions), `design-control-loop` (a scheduled loop with a sensor, a controller, and an actuator that opens small PRs), `improve-claude-md`, `visual-pr`, `show-me`. | Not installed. `design-control-loop` is a candidate for continuous improvement with a deterministic sensor. |
| [blader/humanizer](https://github.com/blader/humanizer) | A skill that removes AI-writing marks: 26 patterns with before and after examples, based on Wikipedia's "Signs of AI writing". MIT. | Copied whole into `skills/writing/humanizer/` (updated by `sync-humanizer.sh`); our adaptations are in `skills/writing/tells.md`. |
| [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | "The lazy senior dev": write only what the task needs, reuse what the repo already has, never cut validation, error handling, security, or accessibility. Its own benchmark: −53% code, −45% tokens, 98% of risky logic with a test (68% without). Has `/ponytail-review` and `/ponytail-audit`. | Installed as a Claude Code plugin (`claude-plugins.txt`) and listed in `opencode.jsonc`. `code.md` tells the agent to follow it. |
