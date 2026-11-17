// Run: HOME=$(mktemp -d) COMMIT_GATE=enforce node --test ~/.agents/hooks/commit-gate.test.mjs
import assert from "node:assert/strict";
import { writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { test } from "node:test";
import { check } from "./commit-gate.mjs";

const blocked = (command) => check(command, tmpdir(), "test").block;

test("a commit without a Verified trailer is blocked", () => {
	assert.equal(blocked(`git commit -m "fix: parser"`), true);
	assert.equal(blocked(`git add . && git commit -am "x"`), true);
	assert.equal(blocked(`cd repo; git -C sub commit -m x`), true);
	assert.equal(blocked(`git -c user.name=a commit -m x`), true);
});

test("a commit with a Verified trailer passes, inline or in a heredoc", () => {
	assert.equal(blocked(`git commit -m "fix" -m "Verified: npm test, 42 passed"`), false);
	assert.equal(blocked(`git commit -m "$(cat <<'EOF'\nfix\n\nVerified: none - no runner\nEOF\n)"`), false);
});

test("a message file is read", () => {
	const file = join(tmpdir(), "commit-gate-msg.txt");
	writeFileSync(file, "fix\n\nVerified: ran it\n");
	assert.equal(blocked(`git commit -F ${file}`), false);
	writeFileSync(file, "fix\n");
	assert.equal(blocked(`git commit --file=${file}`), true);
});

test("commands that only mention commit, or reuse a message, pass", () => {
	assert.equal(blocked(`grep -n "git commit" install.sh`), false);
	assert.equal(blocked(`git log --oneline`), false);
	assert.equal(blocked(`git commit --amend --no-edit`), false);
	assert.equal(blocked(`echo "run git commit later"`), false);
});
