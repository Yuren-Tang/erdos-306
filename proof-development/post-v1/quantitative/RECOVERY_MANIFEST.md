# Recovery manifest

## Role identity

- Role: `E306 — Quantitative Coefficient and Multiplicity Proof Developer 01`
- Role ID: `E306-POST-V1-QUANT-01`
- Lifecycle: one-off proof-development write role
- Control issue: `Yuren-Tang/research-workbench#115`

## Repository state

- Repository: `Yuren-Tang/erdos-306`
- Branch: `proof-development/e306-post-v1-quantitative-v1`
- Authorized starting head: `f03105e95dc2ec5595a931293f6ca951e4bc424a`
- Exact mathematical source: `9790763ab11a4406a7a15f79218e0d96efb81172`
- Context-only clarified source: `f03105e95dc2ec5595a931293f6ca951e4bc424a`

## Created files

1. `QUANTITATIVE_COEFFICIENT_AND_MULTIPLICITY.md`
   - Complete theorem dossier.
   - Contains the coefficient lower bound, unweighted multiplicity exponent, iterated local limit, mesoscopic entropy theorem, exact-cardinality extraction, small-denominator boundary, and deletion counterexample.

2. `SOURCE_MAP.md`
   - Maps every claim to the controlling issue return and exact article sections.
   - Separates the exact mathematical source from the later clarification head.

3. `VALIDATION.md`
   - Records branch, scope, quantifier, inequality, entropy, small-denominator, deletion, and exclusion checks.

4. `RECOVERY_MANIFEST.md`
   - This restart and audit map.

## Commit sequence

- `daac06d83da23ae5c494b76060fdf1bd49203898` — add the principal proof dossier.
- `7432851f2b914ed49eecd1eadcb9581c531f8e9b` — add the source map.
- `a696df86e8dc6e14e124d839f1471367b9b494ee` — add the validation record.
- The commit creating this manifest is the final role commit and is to be read from the branch head or durable return.

## Restart procedure

An independent auditor should:

1. verify that the branch descends from the authorized starting head;
2. compare the branch against `f03105e...` and confirm that only the four authorized files changed;
3. read issue `#115` and feasibility return `#109#issuecomment-5111000940` in full;
4. read the exact source sections identified in `SOURCE_MAP.md` at `9790763...`;
5. check each theorem and exclusion against `VALIDATION.md`;
6. pay particular attention to the order `X->infinity` at fixed `C`, then `C->infinity`, and to the modulo-`r` deletion obstruction.

## Prohibited interpretations

This checkpoint is not a manuscript revision, accepted audit, Lean formalization, PR, release, DOI update, or publication action.  No theorem here should be attributed to the frozen arXiv-v1 candidate until an independent mathematical audit and subsequent Owner disposition authorize that use.
