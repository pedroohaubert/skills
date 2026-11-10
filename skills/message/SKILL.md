---
name: message
description: Write a message the user will paste to someone else — a chat message for Teams or Slack, an email, a note to a colleague or to the business side. Use when asked for a text, message, note, or explanation to send to a person, for questions to ask a business expert, or to shorten or rework one.
---

# Message

The user pastes this into a chat and sends it as their own. The reader did not follow the work, so the message stands alone.

## Steps

1. **Reader.** Name who receives it; infer from the conversation when the request does not say. The reader sets the vocabulary: business readers get the names of screens, fields, and reports; developers get git terms and file names when those help.
2. **Facts.** Collect what happened, why, and what happens next. Every number, date, name, and item comes from the conversation or from something you checked.
3. **Case.** Read the one file that matches and write the message from it:

   | The message | Read |
   |---|---|
   | Tells what happened or changed, and why; or reports a problem and asks the reader about it | `cases/explain.md` |
   | Lists what was delivered, released, or moved to testing | `cases/status.md` |
   | Asks a business expert to decide or confirm the rules of the work | `cases/questions.md` |

4. **Voice.** Write the way the user talks to this person, in the language they use with them:
   - first person, for what the user did;
   - short sentences and everyday words, as said aloud to a colleague;
   - plain text: commas, periods, and parentheses carry the structure.
5. **Length.** Default to the case's shape. "Shorter", or a message for one person's private chat, means cutting examples and side facts while keeping every step of the cause. A reader who says it is confusing gets the missing step back, in its own sentence.
6. **Deliver.** Write the message to a temporary file and run `scripts/copy.sh <file>` so it lands on the clipboard exactly as written. Then show the same text in the reply as plain paragraphs, and on a separate last line say it was copied. Anything left out on purpose goes in one line after that.

Done when someone who was not in the conversation understands the message on one read, every fact traces to the conversation, and the clipboard holds the text.
