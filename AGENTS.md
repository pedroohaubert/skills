# AGENTS.md

Repo público com as skills e a config de agentes do Pedro, instalável por `npx skills add pedroohaubert/skills`. Existe um gêmeo privado, `pedroohaubert/skills-private`, com a mesma estrutura e o mesmo `install.sh`.

- Público é o que é genérico e serve para desenvolvimento de software. Skill de uso pessoal ou do trabalho, dotfiles e qualquer arquivo com caminho de projeto, nome de cliente, colega, URL interna, e-mail corporativo ou token vão para o privado.
- Skill nova ou editada vai em `skills/<nome>/SKILL.md`, com `name` igual ao nome da pasta. Carregue a skill `writing-for-agents` antes de escrever ou editar uma.
- Só `skills/` tem `SKILL.md`. O skills.sh varre o repo inteiro, e um `SKILL.md` em outra pasta vira skill instalável.
- `config/<agente>/` espelha o diretório do agente (`claude` → `~/.claude`, `codex` → `~/.codex`, `pi` → `~/.pi/agent`). Agente novo precisa de uma linha em `agent_dir` no `install.sh`.
- Skill de terceiro não é copiada para cá: entra como linha em `third-party-skills.txt`.
- `install.sh` deve continuar idêntico nos dois repos.
- Depois de mexer em `skills/`, confira com `npx skills add . --list`.
