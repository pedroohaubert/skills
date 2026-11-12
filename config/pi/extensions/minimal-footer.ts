// Rodapé de uma linha (path (branch) · OptChat à esquerda, modelo · thinking à direita)
// e startup sem avisos de collision de skill (o pi não tem setting para isso).
import { homedir } from "node:os";
import { InteractiveMode, type ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

// shortcut: monkey-patch de método interno do pi; se um update renomear showLoadedResources, os avisos voltam (nada quebra).
const proto = InteractiveMode.prototype as any;
if (!proto.__hideSkillCollisions && typeof proto.showLoadedResources === "function") {
	const original = proto.showLoadedResources;
	proto.showLoadedResources = function (this: any, ...args: unknown[]) {
		const loader = this.session?.resourceLoader;
		const getSkills = loader?.getSkills;
		if (!getSkills) return original.apply(this, args);
		loader.getSkills = function (this: unknown) {
			const result = getSkills.call(this);
			return { ...result, diagnostics: result.diagnostics.filter((d: { type: string }) => d.type !== "collision") };
		};
		try {
			return original.apply(this, args);
		} finally {
			loader.getSkills = getSkills;
		}
	};
	proto.__hideSkillCollisions = true;
}

export default function (pi: ExtensionAPI) {
	pi.on("session_start", (_event, ctx) => {
		ctx.ui.setFooter((tui, theme, footerData) => {
			const unsub = footerData.onBranchChange(() => tui.requestRender());
			return {
				dispose: unsub,
				invalidate() {},
				render(width: number): string[] {
					const home = homedir();
					const cwd = ctx.cwd.startsWith(home) ? `~${ctx.cwd.slice(home.length)}` : ctx.cwd;
					const branch = footerData.getGitBranch();
					const where = branch ? `${cwd} (${branch})` : cwd;
					const optchat = footerData.getExtensionStatuses().get("optchat");
					const left = theme.fg("dim", optchat ? `${where} · ${optchat}` : where);
					const right = theme.fg("dim", `${ctx.model?.id ?? ""} · ${pi.getThinkingLevel()}`);
					const pad = " ".repeat(Math.max(1, width - visibleWidth(left) - visibleWidth(right)));
					return [truncateToWidth(left + pad + right, width)];
				},
			};
		});
	});
}
