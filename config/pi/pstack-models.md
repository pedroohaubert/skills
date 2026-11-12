# pstack configuration for Pi

The pstack Pi extension reads this file from `~/.pi/agent/pstack-models.md` and adds it to every session's system prompt. Role model overrides stay out: pstack roles run on the session's model here. The line below stops the extension from injecting the poteto-mode mandate into every session; pstack skills stay available and run only when the user invokes them with `/skill:<name>`.

session hook: off
