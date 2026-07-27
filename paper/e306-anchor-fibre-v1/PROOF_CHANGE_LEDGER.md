# E306-PAPER-01 — proof-change ledger

## Governing baseline

The mathematical baseline is the independently audited dense one-anchor proof:

- candidate: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`;
- independent audit: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`.

The independently verified structural interface is:

- repaired packet at `5945a2b9d3c596bed13f42201be11a39d4a0068c`;
- return: `[PASS E306-AFT-REPAIR-VERIFY-01]`.

No manuscript edit may silently strengthen, weaken, extend or replace a dense provider.  Every mathematical deviation from the baseline must be entered below with its downstream uses and an assurance disposition.

## Change classes

### Class A — exposition and organization

Permitted without a new mathematical proof, provided source meaning is preserved:

- theorem renaming;
- notation normalization;
- prose expansion or compression;
- moving a proved fact to the point where it naturally controls the argument;
- replacing route-specific bookkeeping by the independently verified structural statement;
- splitting one source proposition into several manuscript lemmas, or combining statements whose hypotheses and conclusions are unchanged.

### Class B — bounded mathematical reformulation

Requires an explicit ledger row and independent verification before adoption:

- changing quantifier order;
- replacing uniform estimates by averaged estimates or conversely;
- changing an endpoint, parameter range or strict inequality;
- adding or removing a hypothesis;
- replacing a source estimate by a formally different implication.

### Class C — prohibited without Owner reauthorization

- a dense/sparse or dense/multiblock hybrid;
- a new denominator family or analytic provider;
- a stronger headline theorem;
- a different terminal parameter order;
- treating Lean as a proof of a human-proof step;
- changing publication, release or canonical surfaces.

## Adopted verified interface changes

The following bounded reformulations were independently verified before manuscript use.  Their full closure appears in `AFT_REPAIR_LEDGER.md`.

| ID | Change | Assurance | Manuscript effect |
|---|---|---|---|
| AFT-R01–R09 | exact weighted compression, homomorphic observability, arbitrary minor lanes, measurable alias interface, moving complete-family uniformity | `[PASS E306-AFT-REPAIR-VERIFY-01]` | Sections 2–3 and 10 |
| AFT-R10 | replace obsolete decoder normalization by the exact unnormalized theorem | same | Section 6 uses `0<=alpha_r<=1` and `P_top(exp Delta-1)` |
| AFT-R11 | replace global decoder wording by lane- and coordinate-dependent ranges | same | Sections 6–7 |
| AFT-R12 | place no-wrap after quotient positivity | same | Sections 2 and 9 |

These are not changes to the dense E306 proof; they are the verified final interface through which that proof is presented.

## Manuscript change records

| ID | Date | Class | Location | Source form | Manuscript form | Downstream effect | Status |
|---|---|---|---|---|---|---|---|
| MC-001 | 2026-07-27 | A | global article order | source proof is a linear development note | general tools are stated after the finite Fourier semantics and before their arithmetic providers | no logical dependency changes | ADOPTED |
| MC-002 | 2026-07-27 | A | Section 4 | complete-pair load is computed directly | computation is introduced via the verified pair identity | preserves exact factor `1/2` | ADOPTED |
| MC-003 | 2026-07-27 | A | Section 5, exact cold rigidity | source concludes the exceptional set `E_0` is empty | manuscript writes `R_exc:=|E_0|=0` to display the zero-exception checkpoint without reusing the energy symbol `R` | notation only; no estimate changes | ADOPTED |
| MC-004 | 2026-07-27 | A | Sections 2 and 9 | no-wrap is proved at terminal closure | general exactness interfaces are recorded in Section 2, while the actual E306 no-wrap proof remains in Section 9 | preserves proof order: positivity first, exactness second | ADOPTED |
| MC-005 | 2026-07-27 | A | Section 10 | AFT discussion exists as a separate research packet | scope, failure modes and limitations are integrated after the completed application | no provider is used beyond the verified interface | ADOPTED |
| MC-006 | 2026-07-27 | A | bibliography | formal development described in repository metadata | portable `@misc` BibTeX entry and explicit orthogonality disclaimer | bibliographic/compilation only | ADOPTED |

## No-change declarations

The manuscript has not changed any of the following source facts:

- the prime blocks `Z=X^3`, `P=[X,Z)` and `B=[Z/2,Z)`;
- the denominator families `E_pair` and `E_b`;
- the complete-pair load or its factor `1/2`;
- the variance scale;
- the one-block floor, `s>=16` dispersion threshold or zero-exception result;
- the fingerprint entropy range;
- either row-distance estimate;
- the exact factor partition;
- the unnormalized global fibre error `P_top(exp Delta-1)`;
- the decoder ranges `M_dec` and `X^2/4`;
- the adaptive interval or its endpoints;
- the five-sector partition;
- the Taylor major and aggregate cubic remainder;
- the terminal order `C -> X`;
- the no-wrap, avoidance, numerator induction or `b=1,2` closure.

## Current disposition

```text
NO UNVERIFIED MATHEMATICAL CHANGE RECORDED
SOURCE-PRESERVATION AUDIT PENDING
```
