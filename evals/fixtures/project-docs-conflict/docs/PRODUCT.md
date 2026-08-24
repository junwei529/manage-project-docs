# Product Contract

## Feature A: Queue Input

Feature A accepts external queue input through two public functions:

- `normalize_label(raw)` returns a trimmed, lower-case label with repeated
  whitespace collapsed.
- `parse_priority(raw)` accepts `low`, `normal`, or `high` and returns the
  corresponding numeric priority `1`, `2`, or `3`.

Feature A is accepted only when both functions are implemented and covered by
the repository's unit tests.
