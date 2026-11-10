# skills

Como eu trabalho com agentes de código: as skills que escrevi ou adaptei e a config do Claude Code e do OpenCode, o mais neutra possível.

## Instalar só as skills

```bash
npx skills add pedroohaubert/skills          # escolhe quais
npx skills add pedroohaubert/skills -g --all # todas, globais, todos os agentes
```

Este repo tem duas skills:

| Skill | Para quê |
|---|---|
| `design` | Roteador de design e interface: processo, bibliotecas preferidas, tipografia e as skills do Emil Kowalski como subarquivos |
| `writing` | Escreve, melhora ou corrige texto para pessoas, na sua voz e sem cara de IA: recado para Teams, Slack ou e-mail, perguntas para o negócio, post, artigo, bio, título. O texto final vai para a área de transferência |

## Skills de terceiros e plugins

Estas não ficam copiadas aqui. Quem instala é o `install.sh`, a partir de `third-party-skills.txt` e `claude-plugins.txt`:

- **pstack** (plugin, Claude Code e OpenCode): método de trabalho com princípios, playbooks e verificação. Traz `pstack-technical-writing`, que cuida de documentação, PR e mensagem de commit. Para texto que vai para uma pessoa, use `writing`.
- **Ponytail** (plugin, Claude Code e OpenCode): faz o agente escrever o menor código que resolve a tarefa.
- **Matt Pocock:** `writing-for-agents` (para escrever skills e instruções de agente) e `handoff`.
- **Be Ambitious:** `be-ambitious`, para transformar um pedido em uma versão mais profunda dele.

## Instalar o setup inteiro

```bash
git clone https://github.com/pedroohaubert/skills ~/skills
cd ~/skills && ./install.sh   # ou: config | skills | third-party | plugins | mcp
```

`config/<alvo>/` espelha um diretório da máquina e vira symlink lá: `agents` → `~/.agents` (instruções que qualquer agente lê), `claude` → `~/.claude`, `opencode` → `~/.config/opencode`. O que é de um agente só fica na pasta dele.

Para o OpenCode, o `opencode.jsonc` deste repo carrega os plugins (Ponytail e pstack) e os servidores MCP. Para o Claude Code, o `plugins` instala o pstack e o Ponytail a partir de `claude-plugins.txt`.

As fontes que embasam o setup ficam em [referencias.md](referencias.md). A escolha de modelo por tipo de tarefa está em [modelos.md](modelos.md). O que falta fazer está em [PROXIMOS-PASSOS.md](PROXIMOS-PASSOS.md).

Coisa pessoal (skills do trabalho, dotfiles do terminal) fica num repo privado com a mesma estrutura e o mesmo `install.sh`.
