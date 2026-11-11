# Python, FastAPI, and SQLAlchemy

Defaults for backend code when the repo has not decided, picked by the same bar as everything else: simple, effective, easy to follow, and unlikely to breed new problems. An existing project keeps its tools, layout, and style.

## Tooling for a new project

- **uv** for the environment and dependencies, **ruff** for lint and format, **pytest** for tests. One tool per job, all fast, all configured in `pyproject.toml`.
- Run Python through the project's environment (`uv run`, or the repo's `.venv/bin/python`), never the system interpreter.

## Layers

- **Routes are thin.** A route parses and validates the request (Pydantic), calls one service function, and translates the result into a response. No business decision lives in a route.
- **Business rules are pure functions** that know nothing about FastAPI, the request, or the session: plain values in, plain values out. That is what makes them testable with a table of cases (see `~/.agents/code/tests.md`).
- **Domain refusals are returned, not raised.** A rule that can say no returns a typed refusal (`Refusal(code="not_allowed", action=..., state=...)`), and the route maps each code to its status (403, 409, 422) with a body the client can act on: the action, the current state, the missing fields.

> Example: a workflow kept `transition(state, blocked, action, roles, data)` pure. It returned either a result (next state, columns to write, the event to record) or a refusal (`unknown_action`, `invalid_action`, `missing_role`, `missing_fields`). The service did the I/O around it; the route only mapped refusal codes to HTTP. Every rule was testable without a database.

## Data access

- **Follow the repo's style** (SQLAlchemy Core or ORM, repositories or direct queries). In a new project, prefer explicit queries over ORM magic you have to trace.
- **Transactions are explicit and short.** Read, decide, write, commit in one place; no transaction spanning a network call to another service.
- **Concurrent edits get optimistic concurrency.** Where two people can act on the same record, the write carries the condition it was decided on: `UPDATE ... WHERE id = :id AND state = :state_seen`. Zero rows updated means someone else changed it first: roll back and return 409 with the current state, so the client can refresh instead of silently overwriting.
- **Repeats are not conflicts.** A request that would leave the record exactly as it already is (the same person approving twice) can return success with the current state; only a request that conflicts with someone else's change gets 409.
- **History is written with the change.** When the repo records events or an audit trail, the state change and its event (who, when, from, to) are written in the same transaction, so one never exists without the other.
- **No queries in loops** when one query can fetch the set.

## Configuration and runtime

- **Settings from the environment,** validated once at startup (Pydantic settings or equivalent), so a missing variable fails at boot with its name, not at the first request.
- **Nothing happens at import time** beyond defining things: no network calls, no database connections, no reading files that may not exist.
- **Fail early with the real reason.** A launcher or startup check that tests the database connection and prints why it failed beats a 503 the user has to debug from the browser.
- **Logs explain decisions,** with the identifiers needed to trace them; never log secrets or full personal data.
