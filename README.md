# skills

Como eu trabalho com agentes de código: as skills que escrevi ou adaptei, e a config dos agentes (Claude Code e OpenCode), o mais neutra possível.

## Instalar só as skills

```bash
npx skills add pedroohaubert/skills          # escolhe quais
npx skills add pedroohaubert/skills -g --all # todas, globais, todos os agentes
```

| Skill | Para quê |
|---|---|
| `business-decision-questionnaire` | Transforma as decisões de um plano, ticket ou PR numa mensagem que um especialista do negócio responde de uma vez |

## Instalar o setup inteiro

```bash
git clone https://github.com/pedroohaubert/skills ~/skills
cd ~/skills && ./install.sh   # ou: config | skills | third-party
```

`config/<alvo>/` espelha um diretório da máquina e vira symlink lá: `agents` → `~/.agents` (instruções universais, lidas por qualquer agente), `claude` → `~/.claude`, `opencode` → `~/.config/opencode`. Agentes usados: Claude Code e OpenCode; o que der para ser neutro fica em `~/.agents`.

Coisa pessoal (skills do trabalho, dotfiles do terminal) fica num repo privado com a mesma estrutura e o mesmo `install.sh`.
