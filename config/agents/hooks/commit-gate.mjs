#!/usr/bin/env node
// Commit gate: an agent's commit message must carry a `Verified:` trailer saying how the change was checked.
// Claude Code runs this file as a PreToolUse hook (stdin JSON, exit 2 blocks); the Pi extension imports check().
import { appendFileSync, mkdirSync, readFileSync, realpathSync } from "node:fs";
import { homedir } from "node:os";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

// off | observe (log only) | enforce (block). Flip the default to enforce once the log shows agents comply.
const MODE = process.env.COMMIT_GATE ?? "observe";
const LOG = join(homedir(), ".local/state/commit-gate.log");
const REASON =
	"Commit blocked: the message needs a `Verified: <the check that proved this change>` trailer, or `Verified: none - <why nothing could run>` (~/.agents/AGENTS.md, Done).";

// `git commit` as a command (start of line, after ; & | ( or then/do), allowing `git -C dir` style options before it.
const COMMIT = /(?:^|[;&|(\n]|\bthen\b|\bdo\b)\s*(?:\w+=\S*\s+)*git(?:\s+-[Cc]\s+\S+|\s+--[\w-]+(?:=\S+)?)*\s+commit\b/;
// Commits that reuse an existing message instead of writing one.
const REUSED = /\scommit\b[^;&|\n]*?(?:--no-edit|--fixup|--squash|--reuse-message|\s-C\s)/;
const MESSAGE_FILE = /\scommit\b[^;&|\n]*?\s(?:-F\s*|--file[= ])("[^"]+"|'[^']+'|\S+)/;

export function check(command, cwd, agent) {
	if (MODE === "off" || !COMMIT.test(command) || REUSED.test(command)) return { block: false };
	let message = command;
	const file = command.match(MESSAGE_FILE)?.[1].replace(/^["']|["']$/g, "");
	if (file) {
		try {
			message += readFileSync(resolve(cwd, file), "utf8");
		} catch {}
	}
	const verified = message.includes("Verified:");
	log({ t: new Date().toISOString(), agent, mode: MODE, verified, cwd, command: command.slice(0, 300) });
	return verified || MODE !== "enforce" ? { block: false } : { block: true, reason: REASON };
}

function log(entry) {
	try {
		mkdirSync(dirname(LOG), { recursive: true });
		appendFileSync(LOG, `${JSON.stringify(entry)}\n`);
	} catch {}
}

if (process.argv[1] && realpathSync(process.argv[1]) === fileURLToPath(import.meta.url)) {
	const input = JSON.parse(readFileSync(0, "utf8"));
	if (input.tool_name === "Bash") {
		const { block, reason } = check(input.tool_input?.command ?? "", input.cwd ?? process.cwd(), "claude");
		if (block) {
			process.stderr.write(reason);
			process.exit(2);
		}
	}
}
