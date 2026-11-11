# Tests

What makes a test worth having, and what to do when the repo has no testing habit yet. A repo that already tests in a certain way (framework, folder, style, level) is followed as it is; these rules shape the tests you add inside it.

## The one rule

**A test checks behavior someone depends on, not how the code happens to do it.** It must fail when that behavior breaks and keep passing when only the internals change. Run this check in your head on every test you write or keep:

- Rename a private function, reorder internal steps, swap a data structure: does the test still pass? It should.
- Break the rule the test is named after: does it fail? It must.

Tests that fail on harmless refactors teach people to ignore red; tests that pass while the behavior is broken are worse than no test, because they lie. When your task touches such a test, fix it, or say in the reply why it should go; tests outside the task stay as they are, mentioned at most.

> Bad: assert that `calculateTotal` called `applyDiscount` once with `(order, 0.1)`.
> Good: assert that a 100.00 order with a 10% coupon totals 90.00, and that a coupon never makes the total negative.

## Defaults when the repo has not decided

A repo with no tests at all gets the stack's standard runner (pytest for Python, the runner the frontend toolchain already favors for TypeScript) with the minimum setup the first test needs; name the new dependency in the reply.

1. **Business rules live in pure functions with unit tests.** Pull the decision out of the route, component, or job into a function that takes plain values and returns plain values, then test it with a table of cases: inputs on the left, expected result on the right, one row per rule or edge. These tests are fast, stable, and read like the specification.
2. **Test invariants, not only examples.** Besides "this input gives that output", assert the property that must always hold: "every state that has an owner lands in some role's queue", "every transition in the table is covered by a test case", "a refund never exceeds the original charge". An invariant test catches the case nobody thought to write.
3. **Bugs start with a red test.** Reproduce the bug as a failing test before touching the fix, watch it fail for the reported reason, then fix until it passes. The test stays as the regression guard.
4. **Browser tests only for the flows that must never break** (sign in, save, pay, submit the main form). Drive the real UI with Playwright and mock only the network boundary you do not own. Everything else is cheaper and steadier as a unit test of the logic underneath.

> Example: a ticket workflow kept, in one module, a table "state → whose turn it is → next step". Its test asserted, for every state with an owner and for each variation (unassigned, assigned to someone else, reporter known only by name, blocked), that at least one role sees the item in an action queue. The first run caught a real gap: an in-progress item with no assignee was in nobody's queue.

## Writing the test

- **Name it as the behavior, in the domain's words:** "a rejected ticket can be reopened by triage", not `test_transition_3`.
- **One behavior per test.** Several asserts are fine when they describe the same behavior from different angles.
- **Arrange only what the behavior needs.** A fixture with forty fields hides the two that matter; build the minimum and name the variation.
- **Do not mock your own code.** Mocking a module you own couples the test to its internals. Mock what you do not control (network, clock, third-party APIs), or better, pass it in.
- **Deterministic or deleted.** A flaky test is a bug: fix the timing, the order dependence, or the shared state; never add retries to make it pass.
- **Assert on what users see or receive:** the returned value, the HTTP status and body, the text on screen, the row in the database. Not on calls between your own functions.

## When you change code

- Run the tests that cover what you touched, and the whole suite before you call it done when it is cheap enough.
- A test that breaks because of your change is a question: did the behavior change on purpose? If yes, update the test and say so in the reply; if not, your change is wrong.
- New logic without a test is unfinished when it has a branch, a loop, a parser, money, permissions, or a state machine.
