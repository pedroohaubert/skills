# TypeScript, React, and Next

Defaults for frontend code when the repo has not decided. Each one was picked by the same bar: simple, effective, easy to follow, and unlikely to breed new problems. If the repo already uses a different library or pattern for the same job, use the repo's.

## Types

- **Strict mode, no `any`.** When a value is truly unknown, type it `unknown` and narrow it.
- **States as unions.** `type Status = 'draft' | 'review' | 'approved'` plus an exhaustive `switch` (the compiler flags the case you forgot), instead of `isDraft`, `isReview`, `isApproved` booleans that allow two at once.
- **Derive types from the source.** From the schema, from the API contract, from a `const` array (`typeof STATES[number]`), never a parallel hand-written copy that drifts.

## Data from outside

- **Parse at the boundary.** Every response from the network, `localStorage`, or a URL parameter goes through a schema (Zod, or whatever the repo uses) where it enters the app. Inside, trust the types. A malformed response then fails loudly in one place instead of as `undefined` three components away.
- **Server state belongs to a server-state cache.** For an app with more than a couple of reads, use TanStack Query (or the repo's equivalent) with a single key factory, so every query and every invalidation names its data the same way. Hand-rolled `useEffect` + `fetch` + `useState` re-invents loading, error, caching, and race handling, usually with bugs.
- **Mutations update the cache, not just the server.** On success, write the returned entity into the cache or invalidate the lists it appears in. Use optimistic updates where the action is frequent and almost always succeeds, with rollback on error.
- **Freshness without push:** when the screen must reflect other people's changes and there is no websocket, poll with the cache's `refetchInterval` (seconds for the one item open in a panel, tens of seconds for lists) and refetch on window focus. The query library pauses polling in background tabs; do not hand-roll timers.

## State

- **One owner per piece of state.** URL state (filters, tabs, the open item) has one writer: use one mechanism for all of it. Mixing a URL-state library's setters with direct `router.replace` calls let the library re-write stale parameters after the router had cleared them, so a tab switch silently undid itself.
- **Derived, not effect-synced.** If a value can be computed during render from props, state, or query data, compute it there. `useEffect` is for synchronizing with something outside React (a subscription, the DOM, a timer), not for copying one piece of state into another.
- **Local by default.** State starts in the component that uses it, moves up only as far as the nearest common parent, and goes into a global store only when far-apart parts of the app truly share it.

## Components

- **One component per object, reused everywhere that object appears.** A subset of rows renders with the same table and cells as the full list; a second hand-built row is a second thing to keep in sync.
- **Composition over configuration.** Pass children or small render props instead of growing a component a new boolean prop for every variant.
- **Click targets match intent.** If a whole row opens the item, inline editors inside it stop propagation only over their own content, never over the whole cell.
- **Forms:** plain controlled state for small forms; a form library only when the form is large or deeply validated, and then with the same schema the boundary uses.
- **Memoize after measuring.** `useMemo`, `useCallback`, and `memo` go where a profiler or an obvious hot path says so, not by default.
- **Accessible by construction:** buttons are `<button>`, links are `<a>`, inputs have labels, icon-only controls have `aria-label`, and keyboard paths work. This is part of done, not polish.

## Next

- **Follow the rendering model the repo already uses** (pages or app router, server or client components). Do not introduce a second one for a single feature.
- **Keep secrets and privileged calls on the server.** Anything prefixed for the client (`NEXT_PUBLIC_*`) is public; treat it as such.
- **Never run two dev servers or a build against the same build folder.** They corrupt each other's output; give a second instance its own copy of the project.
