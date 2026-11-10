---
name: writing
description: Write, improve, or correct text meant for people, in the user's voice and free of AI tells — a message to paste in Teams, Slack, or email, questions for a business expert, a LinkedIn post, an article, a bio, a title. Use when asked to write, rework, shorten, fix, translate, or humanize any such text.
---

# Writing

## 1. Mode

Pick the mode before touching the text. The wrong mode is the costliest mistake here.

| The user | Mode | What changes |
|---|---|---|
| Gives their text and asks to fix or correct it, or says to keep their words | **Correct** | Spelling, accents, agreement, punctuation, and errors that break the sense. Every word, joke, aside, question, and the order stay. The correction is nearly invisible. |
| Gives their text and asks to improve, tighten, or shorten it | **Improve** | Sentences. Their ideas, order of reasoning, key words, and voice marks (rhetorical questions, parentheses, humor, examples) stay. |
| Asks for new text, with or without notes | **Write** | Their notes or draft are the base: organize them, keeping their phrasing, and add only the connecting words they need. Each idea is said once. |

Torn between Correct and Improve: correct, and offer the improved version in one line at the end. Correct mode skips step 2 and step 5, and reads only the Corrections section of the voice profile.

## 2. Kind

| Text | Read |
|---|---|
| A message the user pastes to someone: chat, email, a note, questions | `message.md` |
| Public text under the user's name: post, article, bio, title | `public.md` |
| Existing text that sounds AI-written and should read naturally | `tells.md`, plus the row above that matches the text |

## 3. Voice

Read `~/.agents/voice.md` when it exists; otherwise read `voice.md` here. Public text uses the whole profile. A message uses only its corrections and its list of what breaks the voice.

## 4. Facts

Every fact, number, name, date, and quote comes from the user, the conversation, or a source you checked. When the text needs a personal case the user did not give, write a hypothetical ("Imagine…") or ask.

## 5. Check

In Improve and Write, reread the result against `tells.md` and fix what it finds.

## 6. Deliver

Write the final text to a temporary file and run `scripts/copy.sh <file>`, so the clipboard holds it exactly as written. The reply has, in this order:

1. the same text, as plain paragraphs;
2. in Correct mode, a short, dry list of what changed;
3. at most one line for a suggestion beyond the request;
4. a last line saying it was copied.
