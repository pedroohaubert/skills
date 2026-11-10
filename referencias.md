# Referências

O que já estudamos para montar este setup. Cada entrada traz a fonte, o que ela diz e o que tiramos dela. Entrada nova vai no fim, com a data em que foi lida.

## A tese

> O segredo não tá no prompt, tá no setup que tu faz pro agent testar o que está fazendo.

A pirâmide invertida de onde investir, do mais forte para o mais fraco:

1. **Codebase**: boa API, arquitetura, refatoração.
2. **Análise estática**: lint, tipos, compilador, testes, CI.
3. **Verificação**: formal e empírica.
4. **Prosa**: regras, skills, AGENTS.md.
5. **Revisão humana.**

Corolários que anotamos junto:

- Módulos com API bem definida, separando a interface da implementação.
- O mínimo possível de `.md`.
- "Software factory" é marketing. O que funciona é boa engenharia de software e gastar tokens no lugar certo.
- Quanto mais determinístico, melhor, e mais barato em tokens.

## Artigos e papers

### Which Claude model should you build with? (Addy Osmani, 2026-11-09)
https://claude.dev/blog/which-claude-model-should-you-build-with/ · lido em 2026-11-10

- Comece no Opus 5.5 em `medium`. Para tarefa bem delimitada, desça para o Sonnet; para classificar ou extrair, para o Haiku. Para o mais difícil e para runs longos sem supervisão, suba para o Fable.
- Se o modelo não dá conta, a ordem é: dar a ele um jeito de se verificar (teste, build, script), subir o effort um nível e só então trocar de modelo.
- Acima de `high`, um nível a mais de effort custa quase um modelo maior. Teste o modelo de cima num effort mais baixo.
- Subagente para trabalho barato e fácil de conferir (busca, log, rodar testes) em Haiku ou Sonnet. Edição de código e julgamento ficam no modelo principal.
- Rodar em `low` e repetir só as falhas em `high` deu a mesma precisão que tudo em `high`, por cerca de 60% do custo.

**Tiramos:** Opus `medium` como padrão, nada em `xhigh` sem medir, verificação antes de effort.

### When to fold subagents into your main agent loop (Diane Sarkis, 2026-10-22)
https://claude.com/resources/articles/building-agents-when-to-fold-subagents-into-your-main-agent-loop · lido em 2026-11-10

- Um agente só, que carrega skills e ferramentas conforme precisa, muitas vezes ganha de um desenho com subagentes. Foi 2x mais rápido num caso real.
- Cada subagente devolve um resumo com perdas, e encadear vários vira telefone sem fio.
- Subagente se justifica com contexto inchado comprovado, com tarefas paralelas que precisam de contexto limpo e descartável, ou quando há ferramentas demais para escolher.
- Separe por contexto, não por organograma. Skill para o "como a gente faz"; ferramenta para ação, dado ao vivo e limite rígido.
- Escolha de ferramenta piora acima de 30 a 50 definições.
- Antes de mudar a arquitetura, monte um eval pequeno de ponta a ponta e rode cada tarefa mais de uma vez.

**Tiramos:** default de um agente só; subagente apenas para leitura ampla em paralelo.

### Harness Engineering: Anatomy, Architecture, and Evolution of Coding Agents (Barbaste et al., 2026-07)
arXiv:2609.00006 · https://arxiv.org/abs/2609.00006 · lido em 2026-11-10

- Estudo do código-fonte de 11 harnesses: Claude Code, Codex, Gemini CLI, Mistral Vibe, OpenHands, Aider, Mini-SWE-Agent, Hermes, Pi, OpenCode e OpenClaw.
- Nenhum usa framework de agente (LangChain e afins) nem RAG com embeddings sobre código. Todos usam grep, glob, tree-sitter e arquivos `.md` de contexto.
- Mini-SWE-Agent, com cerca de 100 linhas e só bash, fica na mesma faixa de benchmark dos sistemas grandes.
- Num sistema que evolui o próprio harness (Lin et al.), as ferramentas deram +3,3 pontos, o middleware +2,2 e a memória +5,6. O system prompt sozinho deu **−2,3**. Estrutura pesa mais que prosa.
- No trimestre, a regra de comportamento migrou da prosa para a configuração: o harness passa a garantir o que antes só estava escrito no prompt.
- Skills já são mais adotadas que MCP (9 de 11 contra 8 de 11). Trate skill de terceiro como pacote: fonte confiável, revisão, quarentena.
- Fique num agente só até ter uma fase de exploração ampla em que o contexto paralelo claramente ganha da busca em série.

**Tiramos:** a evidência numérica da tese; skills de terceiros entram com curadoria.

### Karpathy-inspired guidelines (multica-ai, 2026-01)
https://github.com/multica-ai/andrej-karpathy-skills · lido em 2026-11-10

Um único `CLAUDE.md` montado a partir das observações do Karpathy sobre os erros de LLM programando: assume coisas sem checar, não pergunta, não mostra trade-off, complica demais e mexe em código que não entendeu. Quatro princípios:

1. **Pensar antes de codar.** Explicite as suposições, mostre as leituras possíveis, diga se há caminho mais simples e pare quando estiver confuso.
2. **Simplicidade.** O mínimo que resolve: nada de abstração de uso único, configuração não pedida ou erro para caso impossível.
3. **Mudanças cirúrgicas.** Toda linha alterada responde ao pedido; siga o estilo existente; avise do código morto alheio, sem apagar.
4. **Execução por objetivo.** Transforme a tarefa em critério verificável ("escreva o teste que reproduz o bug e faça passar") e itere até verificar. Do Karpathy: "não diga o que fazer, dê o critério de sucesso e deixe ele ir."

**Tiramos:** os quatro entraram no nosso AGENTS.md universal, junto com as correções que você repete no histórico.

## Posts

### "O segredo está no prompt" (post, autor não registrado)

O contraponto. Diga o que você quer; se não der certo, pergunte por que e como melhorar; mande o agente pesquisar no Google, no Stack Overflow e no GitHub, porque "99% dos problemas se resolvem lá".

**Tiramos:** guardamos como contraste. Pesquisar na web continua útil, mas não substitui o agente conseguir testar o próprio trabalho.

### Ensinar o agente a "design" (thread, autor não registrado)

- O agente desenhou um popup de onboarding em duas direções no canvas: A, um tour de três passos; B, uma animação em loop.
- Escreveu o que cada uma perde e escolheu B, porque A somava "dois cliques extras num anúncio que a maioria fecha rápido".
- O feedback foi dado como usuário, descrevendo o sintoma: "não dá para ver qual está destacado", "a espera é horrível". O agente achou a solução (a linha virou barra de progresso).
- A regra: explorar direções, raciocinar e iterar a cada passo antes de mandar para revisão. É o chain of thought aplicado ao design.

**Tiramos:** o canvas é a superfície de verificação do design. Feedback descreve o sintoma, não a solução.

### Projeto que fica lento com o tempo (pergunta + respostas)

Pergunta: "o que levava 10 minutos para o Claude 5.5 agora leva 40; como evitar?" Respostas: módulos com API bem definida (`api:impl`) e o mínimo possível de `.md`.

**Tiramos:** fronteiras pequenas para o agente ler a interface e não a implementação; um comando único e rápido de checagem; apagar `.md` velho; sessão nova por unidade de trabalho; erro repetido vira checagem automática.

## Repositórios

| Repo | O que é | Status no setup |
|---|---|---|
| [cursor/plugins › pstack](https://github.com/cursor/plugins/tree/main/pstack) | Playbooks e skills do poteto. O guia (`docs/guide/`) põe verificação no centro: `create-verification-skill`, `correct` (erro repetido vira arquitetura, depois tipo, depois lint, depois teste, e só por último texto), `benchmark-checklist`, princípios nomeados para guiar o agente. | Em uso via fork `michael-denyer/pstack-claude`. A curar: manter o que é verificação, rever o que dispara muitos subagentes e o hook de sessão. |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | Skills de design e animação (animate, review-animations, apple-design, break-ui…). Antes se chamava `emilkowalski/skill`; agora tem também `choreograph`, `gestures` e `remove-animations`. | Em uso. A curar. |
| [humanlayer/skills](https://github.com/humanlayer/skills) | `rpi` (pesquisa → plano → implementação em sessões novas), `design-control-loop` (loop agendado com sensor, controlador e atuador que abre PRs pequenos), `improve-claude-md`, `visual-pr`, `show-me`. | Não instalado. `design-control-loop` é candidato para melhoria contínua com sensor determinístico. |
| [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | "O dev sênior preguiçoso": escrever só o que a tarefa precisa, reusar o que o repo já tem, sem cortar validação, erro, segurança ou acessibilidade. Benchmark próprio: −53% de código, −45% de tokens, 98% da lógica de risco com teste (68% sem). Tem `/ponytail-review` e `/ponytail-audit`. | Instalado só no Pi. Candidato para Claude Code e OpenCode. |
