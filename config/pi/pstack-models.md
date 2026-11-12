# pstack configuration for Pi

The pstack Pi extension reads this file from `~/.pi/agent/pstack-models.md` and adds it to every session's system prompt. Role model overrides stay out: pstack roles run on the session's model here. The line below stops the extension from injecting the poteto-mode mandate into every session; pstack skills stay available and run only when the user invokes them with `/skill:<name>`.

`pi ask tool: off` leaves `ask_user_question` to the rpiv-ask-user-question extension (a fuller dialog: several questions, notes, checkboxes); Pi refuses to start while two extensions register the same tool name. Subagents stay with pstack's own `agent` tool, which works for any delegation, not only pstack skills.

session hook: off
pi ask tool: off
