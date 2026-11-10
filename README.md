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

## Instalar o setup inteiro com um agente

Copie o texto abaixo e cole em um agente de código (Claude Code ou OpenCode), numa pasta vazia:

```text
Quero instalar na minha máquina o setup de agentes do repositório https://github.com/pedroohaubert/skills. Siga estes passos e me avise de cada um:

1. Confira se tenho git, node e npx. Se faltar algum, pare e me diga o que instalar.
2. Clone o repositório em ~/skills. Se a pasta já existir, não apague nada: me pergunte antes.
3. Dentro de ~/skills, rode ./install.sh. Ele cria links nas pastas ~/.agents, ~/.claude e ~/.config/opencode e guarda com o sufixo .bak.<data> tudo que já existia nesses lugares. Se o comando `claude` ou `opencode` não existir, pule os passos de plugins e MCP e me diga.
4. Leia o arquivo config/opencode/opencode.jsonc. O modelo padrão é opencode-go/deepseek-v4.1-flash. Se eu não tiver esse plano, me pergunte qual modelo usar e troque antes de seguir.
5. Confira a instalação: `ls -la ~/.agents ~/.claude/CLAUDE.md ~/.config/opencode/opencode.jsonc` (os links devem apontar para ~/skills), `./check-tree.sh` deve passar, e `npx skills add ~/skills --list` deve listar as skills.
6. Me mostre um resumo: o que foi linkado, o que foi guardado em .bak, e qualquer erro. Não apague nem altere arquivos que não sejam os que o install.sh cria.
```

O agente faz a instalação e te mostra o que mudou. Se algo der errado, os arquivos antigos continuam guardados com o sufixo `.bak`.

## Instalar o setup inteiro na mão

```bash
git clone https://github.com/pedroohaubert/skills ~/skills
cd ~/skills && ./install.sh   # ou: config | skills | third-party | plugins | mcp
```

`config/<alvo>/` espelha um diretório da máquina e vira symlink lá: `agents` → `~/.agents` (instruções que qualquer agente lê), `claude` → `~/.claude`, `opencode` → `~/.config/opencode`. O que é de um agente só fica na pasta dele.

Para o OpenCode, o `opencode.jsonc` deste repo carrega os plugins (Ponytail e pstack) e os servidores MCP. Para o Claude Code, o `plugins` instala o pstack e o Ponytail a partir de `claude-plugins.txt`.

As fontes que embasam o setup ficam em [referencias.md](referencias.md). A escolha de modelo por tipo de tarefa está em [modelos.md](modelos.md). O que falta fazer está em [PROXIMOS-PASSOS.md](PROXIMOS-PASSOS.md).

Coisa pessoal (skills do trabalho, dotfiles do terminal) fica num repo privado com a mesma estrutura e o mesmo `install.sh`.
