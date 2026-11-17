// Commit gate for Pi: the same check Claude Code runs as a hook, from ~/.agents/hooks/commit-gate.mjs.
import { homedir } from "node:os";
import { join } from "node:path";
import { isToolCallEventType, type ExtensionAPI } from "@earendil-works/pi-coding-agent";

type Check = (command: string, cwd: string, agent: string) => { block: boolean; reason?: string };

export default function (pi: ExtensionAPI) {
	pi.on("tool_call", async (event, ctx) => {
		if (!isToolCallEventType("bash", event)) return;
		const { check }: { check: Check } = await import(join(homedir(), ".agents/hooks/commit-gate.mjs"));
		const { block, reason } = check(event.input.command, ctx.cwd, "pi");
		if (block) return { block: true, reason };
	});
}
