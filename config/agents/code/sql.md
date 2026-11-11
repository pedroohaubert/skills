# SQL, migrations, and data fixes

Schema and data changes are the least reversible code you write. These defaults apply when the repo has no process of its own; a repo with one (approval steps, naming, a migration tool) is followed exactly.

## Migrations

- **One migration per change,** named for what it does, with a written downgrade that really restores the previous schema.
- **Never applied to production automatically.** A migration or backfill is reviewed and applied by a person, or by a pipeline step the person approved. Say so in the migration's header when the repo does not enforce it.
- **Check the numbering against the main branch before naming it.** Two branches that both take the next number collide at merge; the second one must be renumbered and its `down_revision` fixed. Look at what main already has, not only your branch.
- **Test the migration, not just the code that uses it:** apply it to an empty in-memory or throwaway database in a test, and assert the tables, constraints, and seed rows exist.
- **Invariants belong in the database too.** A rule that must always hold (unique number, required owner, valid state value) gets a constraint, not only an application check.

## Seeds and permission changes

- **Idempotent.** Running a seed twice leaves the same result as running it once.
- **Merge, don't overwrite.** When a seed adds a key to a JSON column or a permission to a role, it reads the current value, adds its key, and keeps every other key and item intact. The downgrade removes only what the seed added.

> Example: a seed granted a "triage" permission to one role by editing that role's permissions JSON. It looked up the item for its resource, added only its key when missing, preserved every other resource and key, and its downgrade removed only that key, dropping the item when it became empty. Re-running it changed nothing.

## Data fixes and backfills

- **Dry run first.** Before any `UPDATE` or `DELETE`, run the same `WHERE` as a `SELECT COUNT(*)` and a sample, and show both. The count is the contract for the write.
- **Scope to what may change.** Records that represent decisions already made (approved, validated, signed, invoiced) are never touched by a bulk fix; filter them out explicitly in the `WHERE`, even if today's data has none.
- **Know which database you are on.** Development, staging, and production are named in the connection string; read it back before writing, and never run a fix against production without the user's explicit go-ahead for that specific run.
- **Leave a trail:** the script, the counts before and after, and who approved it.

## Queries

- **Parameters, always.** Never build SQL by concatenating values.
- **Index for the queries you actually run,** and check the plan when a query touches a large table.
- **Select the columns you need,** and fetch sets in one query instead of one query per row.
