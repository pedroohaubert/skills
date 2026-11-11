# Writing code

How code should read, in any language. The repo's own conventions override every default here (see `~/.agents/code.md`); these opinions decide what the repo has left open and how the code you add should feel.

The target: a reader opens one file, understands what it does and why, and can change it without fear. Every rule below serves that.

## Names

- **Use the domain's words, in the repo's language.** If the business says "ticket", "triage", "release", the code says `ticket`, `triage`, `release`; if the repo writes identifiers in Portuguese, so do you. One concept, one word, everywhere: a value called `owner` in one file and `responsible` in another is two concepts to the reader.
- **Name by role, not by type.** `pendingTickets`, not `list` or `data`; `deadlineDate`, not `date2`. Generic names (`data`, `info`, `item`, `handle`, `process`, `manager`, `utils`) say nothing; replace them with what the thing is or does.
- **Booleans read as yes/no questions:** `isBlocked`, `hasOwner`, `canTriage`. A function that answers a question is named as one: `isMyTurn(ticket, user)`.
- **Length follows scope.** A loop index can be `i`; a module-level export carries its full meaning.

## Functions and files

- **One job per function, and the name says the job.** If describing it needs "and", it does two.
- **Extract to name a concept or remove duplication, never to make a function shorter.** A helper with one caller that does not name anything new is a detour; inline it.
- **Keep data and logic close to where they are used.** A constant used by one module lives in that module.
- **When a file you are adding to passes a few hundred lines,** split along responsibilities the code already has (rules, rendering, data access), not into arbitrary chunks. Do not split files you are not otherwise changing.
- **Early returns over nesting.** Handle the edge cases at the top, then the main path at the left margin.
- **No boolean flag parameters** that switch a function between two behaviors; write two functions, or pass the thing that varies.

## State and data

- **One owner per piece of state.** Every value has exactly one place that writes it; everything else reads it or derives from it. Two writers (two components, a cache and a local copy, two ways to update the URL) is where drift bugs come from.
- **Derive, don't store.** If a value can be computed from others, compute it. A stored copy of a derived value goes stale.
- **Model states as a closed set.** An item that can be in eleven states gets a union or enum of eleven values and an exhaustive switch, not a pile of booleans that allow impossible combinations.
- **One source of truth for rules.** When two layers need the same table (backend and frontend both need the allowed state transitions), generate one from the other, or check them with a test that fails when they diverge.

> Example: a workflow's state machine lived in the backend as a table of (state, action) → (next state, roles allowed, required fields). The frontend needed the same table to show buttons and validate drag-and-drop. Instead of a hand-written copy, the backend exported the table as JSON and a backend test compared it to the frontend's file, failing with "run with UPDATE=1 to regenerate". Adding a transition became a one-place change with a red test reminding you of the second file.

## Errors

- **Validate at the boundary, trust inside.** Data from outside (requests, files, environment, third-party APIs) is parsed and checked where it enters; internal functions receive typed, valid values and do not re-check them.
- **Domain refusals are values, not exceptions.** A rule that can say no ("this action is not allowed in this state", "this field is required") returns a typed refusal that the boundary maps to the right response (403, 409, 422). Exceptions are for the unexpected.
- **Never swallow an error silently.** Either handle it with a real fallback, or let it reach someone who can: the user, a log, a failing request.

## Comments

Comment only the *why* the code cannot show: a reason, a trap, a decision, a constraint from outside. One short line, written as a statement.

- Good: `// The reloader's child process loses DYLD_LIBRARY_PATH on macOS, so this runs without --reload.`
- Good: `// Unassigned work belongs to any developer; once someone starts it, it becomes theirs.`
- Cut: `// Loop over the tickets`, `// Set the state`, `// Helper function`, and any comment that restates the next line.

When a comment explains *what* a block does, the block wants a better name instead.

## Abstraction

- **No speculative generality.** No option, parameter, plugin point, config flag, or base class for a case nobody asked for. Add it when the second real case arrives; the second case also tells you what actually varies.
- **No wrapper that only renames.** A function that calls one other function with the same arguments is noise.
- **Deletion beats addition.** When you replace a way of doing something, migrate every caller and delete the old way in the same change; two coexisting ways are what the next agent copies.
- **Dead code goes.** Unused exports, unreachable branches, commented-out code: delete them when you touch the area.
