# Refactor

The structure changes; the behavior stays. A bug or a missing feature found on the way is reported and handled as its own task.

1. **Pin the behavior.** Before moving anything, have a test, snapshot, or script that captures what the code does today, and see it pass. Type checks and lint are not a pin.
2. **Name the target shape** in a few lines: the modules, types, and calls as they should be afterwards. The reshape must remove branches, invalid states, or duplication; one that only adds a layer is not worth doing.
3. **Subtract first.** Delete dead code, one-caller wrappers, and redundant checks before building the new shape.
4. **Move in small steps,** each keeping the pin green. When an API changes, migrate every caller and delete the old one in the same change. After a rename, search strings, docs, and config for the old name.
5. **Prove behavior is unchanged** on the real thing: the pin, plus a run of the affected flow.
6. **Keep it only if it reads simpler.** If the result is not easier to follow than before, revert.

With pstack installed, the matching principle skills are `subtract-before-you-add`, `minimize-reader-load`, `model-the-domain`, and `migrate-callers-then-delete-legacy-apis`; read one when its decision comes up.

Done when the pin passes on the new structure and the reply names what got simpler.
