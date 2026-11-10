# skills

Como eu trabalho com agentes de código: as skills que escrevi ou adaptei, e a config dos agentes (Claude Code e OpenCode), o mais neutra possível.

## Instalar só as skills

```bash
npx skills add pedroohaubert/skills          # escolhe quais
npx skills add pedroohaubert/skills -g --all # todas, globais, todos os agentes
```

| Skill | Para quê |
|---|---|
| `design` | Roteador de design e interface: processo, bibliotecas preferidas, tipografia e as skills do Emil Kowalski como subarquivos |
| `writing` | Escreve, melhora ou corrige texto para pessoas, na sua voz e sem cara de IA: recado para Teams/Slack/e-mail, perguntas para o negócio, post, artigo, bio, título. Sai copiado para a área de transferência |

## Instalar o setup inteiro

```bash
git clone https://github.com/pedroohaubert/skills ~/skills
cd ~/skills && ./install.sh   # ou: config | skills | third-party | mcp
```

`config/<alvo>/` espelha um diretório da máquina e vira symlink lá: `agents` → `~/.agents` (instruções universais, lidas por qualquer agente), `claude` → `~/.claude`, `opencode` → `~/.config/opencode`. Agentes usados: Claude Code e OpenCode; o que der para ser neutro fica em `~/.agents`.

As fontes que embasam o setup ficam em [referencias.md](referencias.md).

Coisa pessoal (skills do trabalho, dotfiles do terminal) fica num repo privado com a mesma estrutura e o mesmo `install.sh`.
