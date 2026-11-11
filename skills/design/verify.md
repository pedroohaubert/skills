# Verify

How to look at a UI change when the app needs a login you cannot do, and how to check details the eye misses.

## Capture without the real login

1. Leave the user's own dev servers running; they are watching them. Run yours on another port from a separate copy of the frontend folder (rsync the source, symlink `node_modules`), so the two never share a build cache and the user's server stays up.
2. Start your copy with the app's auth bypass flag inline on the command, never by editing the user's env file.
3. Drive it with Playwright and answer every API call from fixtures through `page.route`, so no database is touched. Mirror the real response envelope and the user-identity endpoint; one fixture set per role, covering every state, a blocked item, long titles, and the empty case.
4. Capture the baseline before changing anything, then the same scenes after, at desktop and phone width.

## Check what the eye misses

- **Alignment:** measure it in the page with `getBoundingClientRect` (centers for an icon under a label, left edges for text under text) and iterate until the numbers match. Three rounds of "looks right" failed where one measurement settled it.
- **Scrollbars:** headless Chromium hides them by default (`--hide-scrollbars`); launch with `ignoreDefaultArgs: ['--hide-scrollbars']` before judging whether a list shows that it scrolls. `offsetWidth` larger than `clientWidth` proves a scrollbar takes space.
- **Behavior:** script the flows a user runs (click each region of a row, open, act, go back between tabs and views) and print what happened, instead of trusting a single screenshot.
- **Polling and timers:** count requests over a fixed window with the page open and closed.

Done when every changed screen has a before and after capture, and every alignment or behavior claim in your reply has a measurement or a scripted run behind it.
