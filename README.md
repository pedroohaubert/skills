# skills

Como eu trabalho com agentes de código: as skills que escrevi ou adaptei, a config do Claude Code, do Codex e do Pi, e a lista das skills de terceiros que uso.

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
cd ~/skills && ./install.sh
```

`install.sh` aceita `config`, `skills` ou `third-party` para rodar uma parte só. `config` cria symlinks dos arquivos de `config/<agente>/` no diretório do agente (`~/.claude`, `~/.codex`, `~/.pi/agent`) e faz backup do que já existia.

## Estrutura

```
skills/                  skills próprias (o que o skills.sh instala)
config/claude/           CLAUDE.md, settings.json, statusline, pstack-models.md
config/codex/            AGENTS.md global do Codex
config/pi/               settings.json do Pi
third-party-skills.txt   skills de outros repos que eu uso: <repo> <skill>...
install.sh               instala tudo isso numa máquina
```

Coisa pessoal (skills do trabalho, dotfiles, config com caminho de projeto) fica num repo privado com a mesma estrutura e o mesmo `install.sh`.
