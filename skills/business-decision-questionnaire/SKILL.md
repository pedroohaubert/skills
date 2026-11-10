---
name: business-decision-questionnaire
description: Message one business expert can answer in one pass. Each question has its own shape, so a skim shows the decision.
disable-model-invocation: true
---

# Business Decision Questionnaire

Turn decisions from plans, tickets, research, PRs, or implemented work into a message that one business expert can answer quickly.

The message is a **skim**. The recipient reads the first line of each question and replies in one pass. Vary the **shape**. The interpretation sits inside the scene, the number, or the question.

## 1. Understand the send

Use the conversation first. Ask only for what is still missing:

1. Who receives it: name, role, and how well they know the subject.
2. What their answers must settle.

Done when you can name the recipient and the decisions, without asking for facts already in the conversation, the repository, the tickets, or the research.

## 2. Recover the decisions

Read the artifacts and separate facts with evidence, decisions already made, and alternatives that are still plausible.

Keep a point only when it changes a business rule, a formula, timing, a classification, an accounting treatment, or something the person sees or does.

Leave out code, file names, functions, tests, migrations, branches, and implementation mechanics. Leave out layout unless it changes the business meaning.

Done when every kept point would change an outcome this person recognizes, and the omitted kinds above are gone.

## 3. Write the message

Write as the user, in first person, in the language they use with the recipient. Address them by name. Short sentences. Their words for the field, the report, the process, and the account. A formula or a short case goes in the question when the rule is numeric or temporal.

Order by how much money or process moves. One rule per question.

Open on the decision. Pick the one shape that makes this rule answerable in one line. The four shapes are options, not a sequence:

- the question itself
- what the person does, and what happens next
- the number or the formula
- a sample they can check, such as a column in a file or a name on a screen

State the interpretation in that opening, as something they can replace in one line. When another rule is still plausible, name it in one sentence in the same question. A pure confirm has no invented alternative.

The last sentence is the ask, and it fits that shape. A yes/no ends on the yes/no. A choice ends on the options. A sample ends on what they should correct.

The opening of the message is one or two sentences: what you are reviewing, plus the part already settled, so they do not re-decide it. Then the numbered questions.

Done when the check below is true.

### Check

- Every claim comes from the source or the user. No invented fact, value, formula, name, or example.
- Each question is answerable with "correto", one of the alternatives named there, or a short correction.
- Swap test: exchange the last sentence of any two questions. At least one of them stops making sense. If both still read fine, they share a frame. Rewrite until the swap fails.
- The reply is one fenced `text` block, ready to paste. Nothing outside the block: no draft, no audit, no preface.
- No em dash or en dash.
