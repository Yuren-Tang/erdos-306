# E306-PAPER-01 — proof-change ledger

## Governing baseline

The original ordinary-proof baseline is the independently audited dense one-anchor proof:

- candidate: `proof-development/e306-one-anchor-v1@07ed8dcaff334ba9da4b9c87337455c2eca25002`;
- independent audit: `review/e306-one-anchor-proof-audit-v1@1d63273ede93e1b83abf1ab9073d91b76600c23c`.

The independently verified structural interface is:

- repaired packet at `5945a2b9d3c596bed13f42201be11a39d4a0068c`;
- return: `[PASS E306-AFT-REPAIR-VERIFY-01]`.

The historical parameterized manuscript baseline is:

- exact head: `544d42d510bcab3ad0ddd7855525770e0d4b0926`;
- exact-head independent verification: `#issuecomment-5128463117`.

The recovered holistic manuscript source was integrated at:

- recovery checkpoint: `c2dfc5120eec017718ef07cbe43f9c151803769c`;
- provenance record: `RECOVERED_SOURCE_PROVENANCE.md`;
- exact-head comparative audit: `#issuecomment-5141204793`;
- exact-head workflows: `verify-e306-manuscript` run `30608129577` and `verify-erdos-306` run `30608129625`, both successful;
- exact-head manuscript: 42 pages;
- comparative disposition: `[BOUNDED-RESTORATION E306-MANUSCRIPT-COMPARATIVE-VALUE-ARCHITECTURE-AUDIT-02]`.

The comparative audit found no manuscript-mathematical repair. No metadata edit may silently strengthen, weaken or replace a manuscript theorem or provider. Every mathematical deviation must be entered below with its downstream uses and assurance disposition.

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
| PC-003 | `544d42d510bcab3ad0ddd7855525770e0d4b0926 -> historical metadata synchronization successor` | A | synchronized top-level control ledgers and PR metadata with the already verified parameterized manuscript | historical control-only transition, later superseded by recovery and integration; no manuscript-mathematical effect |
| PC-004 | `c2dfc5120eec017718ef07cbe43f9c151803769c -> bounded provenance/control repair successor` | A | closes BR-01--BR-03 in `manuscript/BUILD.md`, the five named control ledgers and PR `#9` metadata; distinguishes the forensic evidence object from the current Actions artifact and records the recovered-source lifecycle | changes no theorem, proof, manuscript mathematical section, Lean source, workflow, Makefile or bibliography; narrow exact-diff and exact-head re-check required before readiness |
| PC-005 | `b64bac1f9426cbeb60090a6dbdc147c5e67386ac -> native fixed-ratio writer successor` | B | replaces the append-only fixed-ratio proposition by native standing data `eta in (0,1)` throughout the article; defines `B={q prime: eta Z<=q<Z}` from the start; transports fixed-ratio prime moments, anchor rigidity, fingerprint entropy, row multiplicity and observability, adaptive retained-pair disjointness, actual variance, six-sector estimates, realization, moving-target saturation and sharp quantitative coefficients; deletes the standalone annex and removes the conflicting Hamming-rate use of `eta` | explicitly Owner-authorized by `#issuecomment-5150232754`; writer output only; exact-head manuscript/Lean validation and a separate independent whole-article mathematical/naturalness audit are required before adoption or readiness |

## Native fixed-ratio dependency amendment

The writer successor governed by PC-005 preserves the same one-anchor/fingerprint architecture.  Its standing data are

```text
t=a/b in (0,1), b squarefree,
gamma>1 fixed and admissible,
eta in (0,1) fixed,
Z=X^gamma,
B={q prime: eta Z<=q<Z}.
```

The native prime moments are

```text
|B|=(1-eta+o_eta(1)) Z/log Z,
sum_(q in B) 1/q=(log(1/eta)+o_eta(1))/log Z,
sum_(q in B) 1/q^2=(eta^(-1)-1+o_eta(1))/(Z log Z).
```

Consequently

```text
sigma_E^2
 ~ alpha_(t,gamma)(1-alpha_(t,gamma))
   {1/(2X^2 log^2 X)
    +(eta^(-1)-1)tau(b)/(Z log Z)}.
```

The structural complete-pair coefficient `1/2`, centred CRT interval, `X^2/4` phase cutoff, entropy threshold at `1/2`, Gaussian normalization and all other non-anchor uses of `1/2` are unchanged.  The proof is uniform for `eta` in compact subsets of `(0,1)`.  A varying ratio `eta=eta(X)->1` and the corresponding shrinking-width/thin-anchor or reciprocal-flow theory remain outside this article.

## Architecture transition

The historical candidate `79a43178bdc4919677375362ef58b9c127da18b0` presented the complete proof with:

- fixed `Z=X^3`;
- a five-sector terminal partition;
- the earlier decoder-range description;
- avoiding-unit representation, numerator induction and separate reduced-denominator `1,2` closure.

The verified parameterized manuscript, retained in the recovered integration at `c2dfc5120eec017718ef07cbe43f9c151803769c`, instead presents:

- fixed reduced `t=a/b in (0,1)` with squarefree `b` and fixed `gamma>1`;
- `Z=X^gamma` and target rows indexed by `S_b`;
- the total actual-family variance, with the leading provider changing at `gamma=2`;
- `T_0=kappa_0 min(X^2,Z)` and one pairwise-disjoint exhaustive six-sector architecture for every fixed `gamma>1`;
- the restored cyclic-energy provider;
- direct fixed-target exactness followed by prime-dilution characterization;
- zero-residual finite prescription;
- local replacement distinguished from simultaneous globally proper replacement;
- the preserved entropy, diversity, height, refinement and global-transfer consequences.

PC-005 reparameterizes that same architecture by a fixed native anchor ratio.  It does not add a second anchor theory, thin-anchor exponent theorem, reciprocal-flow provider or stronger headline theorem.

## Lifecycle heads and publication-gate boundary

- `79a43178bdc4919677375362ef58b9c127da18b0` is the historical pre-integration refrozen candidate. Its 44-page technical publication gate applies only to that exact head.
- `a4fb7ed78bf217ce310ab147c82af2a49f0029bb` is the unrefrozen integration writer candidate that required bounded repair.
- `544d42d510bcab3ad0ddd7855525770e0d4b0926` is the independently verified historical 39-page parameterized manuscript baseline.
- `c2dfc5120eec017718ef07cbe43f9c151803769c` is the recovered-source integration checkpoint. Its 42-page manuscript and Lean workflows succeeded, and the comparative audit found no mathematical repair.
- `b64bac1f9426cbeb60090a6dbdc147c5e67386ac` is the rejected append-only fixed-ratio absorption head and the exact authorized starting head for PC-005.
- The PC-005 successor is a bounded Class-B whole-article reparameterization writer result. It is not independently certified, refrozen, ready for review, merged, licensed, released, uploaded or submitted by this ledger.
- No refreeze or publication gate transfers automatically from an earlier head.

## Current disposition

```text
NATIVE FIXED-RATIO WHOLE-ARTICLE REPARAMETERIZATION WRITER ACTIVE
APPEND-ONLY FIXED-RATIO ANNEX REMOVED
DEFAULT TYPOGRAPHY PRESERVED
INDEPENDENT WHOLE-ARTICLE MATHEMATICAL/NATURALNESS AUDIT REQUIRED
PR #9 REMAINS OPEN / DRAFT / UNMERGED
NOT REFROZEN / NO PUBLICATION GATE TRANSFERRED
```
