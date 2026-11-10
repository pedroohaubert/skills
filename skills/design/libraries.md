# Libraries and components

## Steps

1. **Use what the project has.** Read `package.json` and `components.json`. An installed library that covers the task wins; an installed competitor of a pick below stays unless the user asks to switch.
2. **Otherwise use the pick** from the stack below. Recommend one, in one sentence, and wire it up.
3. **Ready-made component:** look in the sources below, favourites first.
4. **Nothing fits, or the closest match would need heavy rework:** search Shoogle, which indexes shadcn registries. With the MCP server: `search_registry_items` (or `search_registry_items_scoped` to limit registries). Without it: `npx shadcn@latest search @shoogle -q "<query>"`. Install the result with `npx shadcn@latest add <item>`.
5. **Adapt what you install.** A downloaded component is a starting point: change its colors, radius, spacing, type, and motion to the app's tokens, so the whole application keeps one visual identity. Consistency across the app outranks the component's stock look.

## Stack

| Need | Pick |
|---|---|
| Framework | Next.js, React, TypeScript |
| Styling | Tailwind CSS |
| Components | shadcn/ui on Base UI primitives |
| Variants and class names | cva, clsx, tailwind-merge |
| Dark mode | next-themes |
| Icons | lucide |
| Animation | motion; plain CSS transitions for a simple hover or fade |
| Animated numbers | NumberFlow |
| Toasts | Sonner |
| Command menu | cmdk |
| Charts | recharts |
| Drag and drop | dnd kit |
| Client state | zustand |
| URL state | nuqs |

## Component sources

Each `llms.txt` indexes per-component docs: fetch it, then only the component you need.

| Source | Good for | Install |
|---|---|---|
| [interior.dev](https://www.interior.dev/llms.txt) (favourite) | Post-click feedback: copy and loading buttons, hold to confirm, modal, drawer, tabs | `npx shadcn@latest add https://www.interior.dev/r/<name>.json` |
| [Dice UI](https://diceui.com/llms.txt) (favourite) | Accessible shadcn extensions on Base UI: data table, data grid, kanban, combobox, file upload, stepper, tour | shadcn-style copy, from each component page under `/docs/components/base/` |
| [aicss.dev](https://www.aicss.dev/llms.txt) | AI agent interfaces: thinking state, tool calls, streaming text, citations, file diff | Copy-paste; index at `https://www.aicss.dev/r`. Pro components need a licence: leave them |
| [Fancy Components](https://www.fancycomponents.dev/llms.txt) | Landing and artistic pages: text effects, image trail, physics, SVG filters | `npx shadcn@latest add @fancy/<name>` with `"@fancy": "https://fancycomponents.dev/r/{name}.json"` in `components.json` |
| [bencho.dev](https://bencho.dev/llms.txt) | Artistic interactive blocks: dynamic island, magnifying dock, card stack, jelly tabs | Copy the block's source |
| [loading.dev](https://loading.dev/llms.txt) | Loading spinners | `npm install loading-dev` |
| [ascii.rest](https://ascii.rest/llms.txt) | Animated ASCII art and banners | `npm install ascii.rest` |
