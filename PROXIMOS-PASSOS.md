# Próximos passos

Estado em 2026-11-10. A árvore está ativa na máquina (`./install.sh config`), com as skills `design` e `writing`, os plugins pstack e Ponytail (Claude Code e OpenCode; no OpenCode o pstack vem do plugin `github:michael-denyer/pstack-claude#main`), e a config de modelos em `modelos.md`. Modelo padrão do OpenCode confirmado em sessão nova: DeepSeek V4.1 Flash.

## A fazer

1. **Engordar a parte de código.** Hoje `code.md` e os playbooks são arquivos pequenos. A ideia é levar parte disso para skills próprias, mais opinativas, como foi feito com `design` e `writing`: como eu quero que o código seja escrito, estruturado e revisado, com exemplos. Os princípios do pstack e o Ponytail são a base; falta a minha camada por cima.
2. **Testar os playbooks de código às cegas** (feature, refactor, investigation, pull-request), como foi feito com a `writing`. O de PR é o que mais depende de gosto.
3. **Conselheiro:** `advisorModel` aponta para o Fable. Quando o Fable sair do plano, desligar com `/advisor`.
4. **Muse Ember:** incluir em `modelos.md` e no OpenCode quando entrar no plano Go.
5. **lessons.design:** a página não carregou; ler e registrar em `referencias.md`.
6. **Skills paradas no privado:** `apontamento-horas` e `limpeza-mac` ainda estão em português e fora do padrão novo.
7. **Trocar credenciais** que aparecem em texto puro no histórico de prompts e no `~/.codex/config.toml`.

## Como retomar

Leia `AGENTS.md` (regras do repo), `referencias.md` (o que embasou cada decisão) e este arquivo. Regra de trabalho: perguntar antes de escrever, testar skill com um agente novo antes de dar por pronta, e rodar `./check-tree.sh` depois de mexer em `config/agents/`.
