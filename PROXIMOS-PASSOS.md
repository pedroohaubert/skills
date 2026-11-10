# Próximos passos

Estado em 2026-11-10. A árvore está ativa na máquina (`./install.sh config`), com as skills `design` e `writing`, os plugins pstack e Ponytail, e a config de modelos em `modelos.md`.

## A fazer

1. **Engordar a parte de código.** Hoje `code.md` e os playbooks são arquivos pequenos. A ideia é levar parte disso para skills próprias, mais opinativas, como foi feito com `design` e `writing`: como eu quero que o código seja escrito, estruturado e revisado, com exemplos. Os princípios do pstack e o Ponytail são a base; falta a minha camada por cima.
2. **Testar os playbooks de código às cegas** (feature, refactor, investigation, pull-request), como foi feito com a `writing`. O de PR é o que mais depende de gosto.
3. **OpenCode ignora o modelo padrão.** `config/opencode/opencode.jsonc` define `opencode-go/deepseek-v4.1-flash`, mas `opencode run` abriu num modelo gratuito. Com `-m` funciona. Descobrir a chave certa na versão 2.
4. **Ponytail no OpenCode.** O plugin foi adicionado em `opencode.jsonc` (`plugins`), sem teste. Conferir que carrega.
5. **Configurar o Ponytail no Claude Code:** `/plugin configure ponytail@ponytail` (quatro opções ainda sem valor).
6. **Conselheiro:** `advisorModel` aponta para o Fable. Quando o Fable sair do plano, desligar com `/advisor`.
7. **Muse Ember:** incluir em `modelos.md` e no OpenCode quando entrar no plano Go.
8. **lessons.design:** a página não carregou; ler e registrar em `referencias.md`.
9. **Skills paradas no privado:** `apontamento-horas` e `limpeza-mac` ainda estão em português e fora do padrão novo.
10. **Trocar credenciais** que aparecem em texto puro no histórico de prompts e no `~/.codex/config.toml`.

## Como retomar

Leia `AGENTS.md` (regras do repo), `referencias.md` (o que embasou cada decisão) e este arquivo. Regra de trabalho: perguntar antes de escrever, testar skill com um agente novo antes de dar por pronta, e rodar `./check-tree.sh` depois de mexer em `config/agents/`.
