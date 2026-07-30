# E306-PAPER-01 — proof-change ledger

## Governing baseline

The original ordinary-proof baseline is the independently audited dense one-anchor proof:

- candidate: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`;
- independent audit: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`.

The independently verified structural interface is:

- repaired packet at `5945a2b9d3c596bed13f42201be11a39d4a0068c`;
- return: `[PASS E306-AFT-REPAIR-VERIFY-01]`.

The current manuscript-mathematical baseline is:

- exact head: `544d42d510bcab3ad0ddd7855525770e0d4b0926`;
- exact-head independent verification: `#issuecomment-5128463117`;
- disposition: no manuscript-mathematical, TeX, bibliography, workflow, font or visual defect found.

No metadata edit may silently strengthen, weaken or replace a manuscript theorem or provider. Every mathematical deviation must be entered below with its downstream uses and assurance disposition.

## Change classes

### Class A — exposition, organization and control metadata

Permitted when source meaning is preserved:

- theorem renaming;
- notation normalization;
- prose expansion or compression;
- moving a proved fact to the point where it controls the argument;
- replacing route-specific bookkeeping by an independently verified structural statement;
- synchronizing ledgers and lifecycle records with an already verified manuscript.

### Class B — bounded mathematical reformulation

Requires an explicit ledger row and independent exact-head verification before adoption:

- changing quantifier order;
- changing an endpoint, parameter range or strict inequality;
- adding or removing a hypothesis;
- replacing a source estimate or proof route by a formally different implication;
- changing the proof architecture while preserving the headline theorem.

### Class C — prohibited without Owner reauthorization

- an unaudited hybrid proof;
- a new denominator family or analytic provider;
- a stronger headline theorem;
- a different terminal parameter order;
- treating Lean as a proof of a human-proof step;
- changing publication, release or canonical surfaces.

## Adopted verified structural interface

| ID | Change | Assurance | Manuscript effect |
|---|---|---|---|
| AFT-R01–R09 | exact weighted compression, homomorphic observability, arbitrary minor lanes, measurable alias interface, moving complete-family uniformity | `[PASS E306-AFT-REPAIR-VERIFY-01]` | Sections 2–3 and 10 |
| AFT-R10 | replace obsolete decoder normalization by the exact unnormalized theorem | same | Section 6 uses `0<=alpha_r<=1` and the exact tensor error |
| AFT-R11 | replace global decoder wording by lane- and coordinate-dependent ranges | same | Sections 6–7 |
| AFT-R12 | place no-wrap after quotient positivity | same | Sections 2 and 9 |

These are the verified interface through which the concrete proof is presented.

## Parameterized integration and repair records

| ID | Exact transition | Class | Mathematical and architectural change | Assurance and lifecycle |
|---|---|---|---|---|
| PC-001 | `79a43178bdc4919677375362ef58b9c127da18b0 -> a4fb7ed78bf217ce310ab147c82af2a49f0029bb` | B | integrated fixed reduced targets `t=a/b`, fixed `gamma>1`, `Z=X^gamma`, target rows, parameterized coefficient, entropy, height and refinement consequences | writer candidate only; unrefrozen; later audit required repair |
| PC-002 | `a4fb7ed78bf217ce310ab147c82af2a49f0029bb -> 544d42d510bcab3ad0ddd7855525770e0d4b0926` | B | corrected prime-divisor indexing and `tau(b)`; restored multiplicity-sensitive cyclic energy; adopted one total-variance formula, universal `T_0`, and one exhaustive six-sector architecture; replaced avoiding-unit/numerator-induction/special-denominator closure by prime dilution; added zero-residual finite prescription; corrected local versus simultaneous proper replacement and quantitative globally proper branching | independently verified mathematically, typographically and visually at `#issuecomment-5128463117`; workflows `#639` and `#78` passed |
| PC-003 | `544d42d510bcab3ad0ddd7855525770e0d4b0926 -> synchronized metadata successor` | A | synchronizes only top-level control ledgers and PR metadata with the already verified manuscript | changes no manuscript, theorem, Lean source, workflow, Makefile or bibliography; successor pending independent control-surface verification and Owner disposition |

## Architecture transition

The historical candidate `79a43178bdc4919677375362ef58b9c127da18b0` presented the complete proof with:

- fixed `Z=X^3`;
- a five-sector terminal partition;
- the earlier decoder-range description;
- avoiding-unit representation, numerator induction and separate reduced-denominator `1,2` closure.

The verified manuscript at `544d42d510bcab3ad0ddd7855525770e0d4b0926` instead presents:

- fixed reduced `t=a/b in (0,1)` with squarefree `b` and fixed `gamma>1`;
- `Z=X^gamma` and target rows indexed by `S_b`;
- the total actual-family variance, with the leading provider changing at `gamma=2`;
- `T_0=kappa_0 min(X^2,Z)` and one pairwise-disjoint exhaustive six-sector architecture for every fixed `gamma>1`;
- the restored cyclic-energy provider;
- direct fixed-target exactness followed by prime-dilution characterization;
- zero-residual finite prescription;
- local replacement distinguished from simultaneous globally proper replacement;
- the preserved entropy, diversity, height, refinement and global-transfer consequences.

This is an adopted, independently verified mathematical reformulation of the article architecture, not a metadata invention.

## Lifecycle heads and publication-gate boundary

- `79a43178bdc4919677375362ef58b9c127da18b0` is the historical pre-integration refrozen candidate. Its 44-page technical publication gate applies only to that exact head.
- `a4fb7ed78bf217ce310ab147c82af2a49f0029bb` is the unrefrozen integration writer candidate that required bounded repair.
- `544d42d510bcab3ad0ddd7855525770e0d4b0926` is the independently verified 39-page manuscript baseline.
- The metadata-only synchronization successor is not refrozen and must receive independent control-surface verification before any Owner disposition.
- No refreeze or publication gate transfers automatically from an earlier head.

## Protected no-change boundary for this synchronization

The metadata-only synchronization changes none of the following:

- manuscript source or prose;
- theorem, proposition, lemma, corollary, definition, proof or displayed equation;
- Lean source;
- workflow or Makefile;
- bibliography;
- generated PDF or source archive;
- licence, tag, release, DOI, Zenodo, arXiv or journal surface.

The exhaustive Git tree comparison against `544d42d510bcab3ad0ddd7855525770e0d4b0926` is the controlling byte-identity check.

## Current disposition

```text
PARAMETERIZED MANUSCRIPT BASELINE VERIFIED AT 544d42d510bcab3ad0ddd7855525770e0d4b0926
CONTROL METADATA SYNCHRONIZED ONLY
NO UNVERIFIED MANUSCRIPT-MATHEMATICAL CHANGE RECORDED
SYNCHRONIZED HEAD PENDING INDEPENDENT CONTROL-SURFACE VERIFICATION
NOT REFROZEN / NO PUBLICATION GATE TRANSFERRED
```
