# Modelos

Qual modelo para quê. Fonte: [Which Claude model should you build with](https://claude.dev/blog/which-claude-model-should-you-build-with/) e os limites do OpenCode Go (ver `referencias.md`).

## Claude Code

| Uso | Modelo | Como está configurado |
|---|---|---|
| Padrão: engenharia do dia a dia, debug, feature | Opus 5.5 no médio | `model: opus` e `effortLevel: medium` em `~/.claude/settings.json` |
| Tarefa bem delimitada, texto, revisão repetida | Sonnet 5.5 no médio | `/model sonnet` quando quiser |
| Busca no código e na documentação | Haiku 5.5 | subagente `Explore` em `config/claude/agents/` |
| Rodar testes, build, lint e ler logs | Haiku 5.5 | subagente `runner` em `config/claude/agents/` |
| Migração grande, arquitetura, trabalho longo sem supervisão | Fable 5.2 no médio | `/model fable`, enquanto o plano der acesso |

Antes de subir o esforço, dê ao agente um jeito de se verificar. Acima de `high`, vale mais o modelo de cima num esforço menor. Troque de modelo numa pausa natural: a primeira resposta no modelo novo paga o cache da conversa inteira.

O conselheiro (`advisorModel`) está em Fable. Quando o Fable sair do plano, desligue com `/advisor`.

## OpenCode (tarefas menores, plano Go)

| Uso | Modelo | Por quê |
|---|---|---|
| Padrão: debug, edição em vários arquivos, busca | `opencode-go/deepseek-v4.1-flash` | Teto de US$ 100 por mês no Go, o maior dos três, e rápido |
| Interface, texto, edição pequena que precisa sair pronta | `opencode-go/claude-haiku-5-5` | Melhor nota em código pronto para merge e em UI; o teto é de US$ 15 por mês, então use de propósito |
| Muitos passos de chamada de ferramenta | Muse Ember, quando entrar no Go | Feito para tool calls; hoje só existe na API da Meta |

O modelo padrão está em `config/opencode/opencode.jsonc`. Pendência: o `opencode run` ignorou essa chave no teste e abriu num modelo gratuito; com `-m opencode-go/deepseek-v4.1-flash` funciona.
