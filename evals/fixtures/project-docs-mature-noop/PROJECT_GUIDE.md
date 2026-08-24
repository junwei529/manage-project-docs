# Range Ledger Project Guide

## Purpose And Scope

Range Ledger provides `inclusive_sum(start, end)` for integer ranges. It does
not validate non-integer input or provide a command-line interface.

## Work And Verification

Keep implementation under `src/` and tests under `tests/`. Run:

```text
python -m unittest discover -s tests -v
```

## Authority And Write Routing

This file is the canonical write locus for project scope, working rules,
current state, evidence, and recovery. `README.md` is a short entry point and
links here.

## Current State And Evidence

`inclusive_sum` is implemented for inclusive integer ranges. The focused unit
test is the evidence owner; rerun it before claiming the current checkout is
verified.

## Next Action And Recovery

No feature work is active. Resume by reading this file, inspecting
`src/range_ledger.py`, and running the focused test. Ask before changing the
documentation structure or committing.
